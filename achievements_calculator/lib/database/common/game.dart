class Game {
  late String name, image;
  int? id;
  late int idUser;
  late double percentage;

  Game(this.id, this.image, this.name, this.percentage, this.idUser);

  factory Game.fromJson(Map<String, dynamic> parsedJson) {
    return Game(parsedJson['id'], parsedJson['image'], parsedJson['name'],
        parsedJson['percentage'], parsedJson['idUser']);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["image"] = image;
    map["name"] = name;
    map["percentage"] = percentage;
    map["idUser"] = idUser;
    return map;
  }
}
