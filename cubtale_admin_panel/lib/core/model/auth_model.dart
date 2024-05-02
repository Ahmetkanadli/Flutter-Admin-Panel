import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User users) => json.encode(users.toJson());

class User{
  final List<Users>? users;

  User({required this.users});

  factory User.fromJson(Map<String, dynamic> json) => User(
    users: List< Users>.from(json["users"].map((x) => Users.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class Users{

  final String acc_id ;
  final String acc_token;
  final String acc_name;
  final String acc_surname;
  final bool acc_role;

  Users({

    required this.acc_id,
    required this.acc_token,
    required this.acc_name,
    required this.acc_surname,
    required this.acc_role,
  });


  factory Users.fromJson(Map<String, dynamic> json) => Users(
      acc_id : json["acc_id"],
      acc_token: json["acc_mail"],
      acc_name : json["acc_name"],
      acc_surname : json["acc_surname"],
      acc_role : json["acc_verified"],
  );

  Map<String, dynamic> toJson() => {
    "acc_id" : acc_id,
    "acc_mail" : acc_token,
    "acc_name" : acc_name,
    "acc_surname" : acc_surname,
    "acc_verified" : acc_role,
  };
}