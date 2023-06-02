class User {
  late String nickname, password;
  int? id;

  User(this.id, this.nickname, this.password);

  User.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.nickname = obj['nickname'];
    this.password = obj['password'];
  }

  String get _nickname => nickname;
  String get _password => password;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["nickname"] = nickname;
    map["password"] = password;
    return map;
  }
}
