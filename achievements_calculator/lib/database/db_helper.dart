import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(
      sql.Database databaseAchievementsCalculator) async {
    await databaseAchievementsCalculator.execute("""CREATE TABLE user{
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          nickname TEXT NOT NULL,
          password TEXT NOT NULL,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        }""");

    await databaseAchievementsCalculator.execute("""CREATE TABLE game{
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          name TEXT NOT NULL,
          percentage INTEGER NOT NULL,
          idUser INTEGER,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
          foreign key(idUser) references user(id)
        }""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db", version: 1, onCreate:
        (sql.Database databaseAchievementsCalculator, int version) async {
      await createTables(databaseAchievementsCalculator);
    });
  }

  static Future<int> createUser(String nickname, String password) async {
    final db = await SQLHelper.db();

    final user = {'nickname': nickname, 'password': password};
    final id = await db.insert('user', user,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await SQLHelper.db();
    return db.query('user', orderBy: 'id');
  }
}
