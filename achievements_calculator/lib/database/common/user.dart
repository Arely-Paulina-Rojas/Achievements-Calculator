class User {
  late String nickname, password, avatar;
  int? id;

  User(this.id, this.nickname, this.password, this.avatar);

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(parsedJson['id'], parsedJson['nickname'],
        parsedJson['password'], parsedJson['avatar']);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["nickname"] = nickname;
    map["password"] = password;
    map["avatar"] = avatar;
    return map;
  }
}
