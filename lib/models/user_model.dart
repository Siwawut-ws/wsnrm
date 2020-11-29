import 'dart:convert';

class UserModel {

  final String type;
  final String storing;
  final String name;
  final String user;
  final String password;
  UserModel({
    this.type,
    this.storing,
    this.name,
    this.user,
    this.password,
  });


  UserModel copyWith({
    String type,
    String storing,
    String name,
    String user,
    String password,
  }) {
    return UserModel(
      type: type ?? this.type,
      storing: storing ?? this.storing,
      name: name ?? this.name,
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'storing': storing,
      'name': name,
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      type: map['type'],
      storing: map['storing'],
      name: map['name'],
      user: map['user'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(type: $type, storing: $storing, name: $name, user: $user, password: $password)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.type == type &&
      o.storing == storing &&
      o.name == name &&
      o.user == user &&
      o.password == password;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      storing.hashCode ^
      name.hashCode ^
      user.hashCode ^
      password.hashCode;
  }
}
