import 'dart:convert';
import 'dart:ffi';
import 'package:sqflite/sqflite.dart' as sql;
import 'common/game.dart';
import 'common/user.dart';

class SQLHelper {
  static Future<void> createTables(
      sql.Database databaseAchievementsCalculator) async {
    await databaseAchievementsCalculator.execute("""CREATE TABLE user (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          nickname TEXT NOT NULL,
          password TEXT NOT NULL,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )""");

    await databaseAchievementsCalculator.execute("""CREATE TABLE game (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          image TEXT,
          name TEXT NOT NULL,
          percentage REAL NOT NULL,
          idUser INTEGER,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          foreign key(idUser) references user(id)
        )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db", version: 1, onCreate:
        (sql.Database databaseAchievementsCalculator, int version) async {
      await createTables(databaseAchievementsCalculator);
    });
  }

  /*
  static Future<int> createUser(String nickname, String password) async {
    final db = await SQLHelper.db();

    final user = {'nickname': nickname, 'password': password};
    final id = await db.insert('user', user,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  } */

  static Future<int> createUser(User user) async {
    final db = await SQLHelper.db();
    final id = await db.insert("user", user.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createGame(Game game) async {
    final db = await SQLHelper.db();
    final id = await db.insert("game", game.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  /*
  static Future<int> createGame(
      String name, double percentage, int idUser) async {
    final db = await SQLHelper.db();

    final game = {'name': name, 'percentage': percentage, 'idUser': idUser};
    final id = await db.insert('game', game,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  } */

  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await SQLHelper.db();
    return db.query('user', orderBy: 'id');
  }

  static Future<List<Game>?> getAllGamesByUser(int idUser) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result =
        await db.query('game', where: "idUser = ?", whereArgs: [idUser]);
    if (result.isEmpty) return List.empty();
    return result.map((e) => Game.fromJson(e)).toList();
  }
  /*
  static Future<List<Map<String, dynamic>>> getAllGamesByUser(
      int idUser) async {
    final db = await SQLHelper.db();
    return db.query('game', where: "idUser = ?", whereArgs: [idUser]);
  }*/

  static Future<User?> getSingleUser(int id) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result =
        await db.query('user', where: "id = ?", whereArgs: [id], limit: 1);
    if (result.isNotEmpty) {
      return User.fromJson(result[0]);
    } else {
      return null;
    }
  }
  /* static Future<List<Map<String, dynamic>>> getSingleUser(int id) async {
    final db = await SQLHelper.db();
    return db.query('user', where: "id = ?", whereArgs: [id], limit: 1);
  } */

  static Future<bool> validateNickname(String nickname) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result = await db.query('user',
        where: "nickname = ?", whereArgs: [nickname], limit: 1);
    if (result.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> validateUpdateNickname(String nickname, int? id) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result = await db.query('user',
        where: "nickname = ? and id <> ?", whereArgs: [nickname, id], limit: 1);
    if (result.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> getSingleGame(int id) async {
    final db = await SQLHelper.db();
    return db.query('game', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<User?> login(User user) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result = await db.query('user',
        where: "nickname = ? and password = ?",
        whereArgs: [user.nickname, user.password],
        limit: 1);
    if (result.isNotEmpty) {
      return User.fromJson(result[0]);
    } else {
      return null;
    }
  }

  /*
  static Future<List<Map<String, dynamic>>> login(
      String nickname, String password) async {
    final db = await SQLHelper.db();
    return db.query('user',
        where: "nickname = ? and password = ?",
        whereArgs: [nickname, password],
        limit: 1);
  }
  */

  static Future<int> updateUser(User user) async {
    final db = await SQLHelper.db();
    final userData = {
      'nickname': user.nickname,
      'password': user.password,
      'createdAt': DateTime.now().toString()
    };
    final result = await db
        .update('user', userData, where: "id = ?", whereArgs: [user.id]);
    return result;
  }

  static Future<int> updateGame(int id, String name, double percentage) async {
    final db = await SQLHelper.db();
    final game = {
      'name': name,
      'percentage': percentage,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('game', game, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('user', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteGame(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('game', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Map<String, dynamic>>> caculateAverage(int idUser) async {
    final db = await SQLHelper.db();
    final result = await db.rawQuery(
        "SELECT AVG(percentage) AS average FROM game  WHERE idUser = " +
            idUser.toString());
    return result;
  }
}
