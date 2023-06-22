class Game {
  late String name, image;
  int? id;
  late int user;
  late double percentage;

  Game(this.id, this.image, this.name, this.percentage, this.user);

  factory Game.fromJson(Map<String, dynamic> parsedJson) {
    return Game(parsedJson['id'], parsedJson['image'], parsedJson['name'],
        parsedJson['percentage'], parsedJson['user']);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["image"] = image;
    map["name"] = name;
    map["percentage"] = percentage;
    map["user"] = user;
    return map;
  }
}
