import 'User.dart';

class Data {
  Data({
      this.user, 
      this.accessToken, 
      this.refreshToken,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
  User? user;
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }

}