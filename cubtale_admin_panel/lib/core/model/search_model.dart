import 'dart:convert';

SearchUser searchUserFromJson(String str) => SearchUser.fromJson(json.decode(str));

String userToJson(SearchUser users) => json.encode(users.toJson());

class SearchUser{
  final List<SearchUsers>? users;

  SearchUser({required this.users});

  factory SearchUser.fromJson(Map<String, dynamic> json) => SearchUser(
    users: List< SearchUsers>.from(json["users"].map((x) => SearchUsers.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class SearchUsers{

  final String acc_id ;
  final String acc_mail;
  final String acc_name;
  final String acc_surname;
  final bool acc_verified;
  final String acc_creation_date;

  SearchUsers({

    required this.acc_id,
    required this.acc_mail,
    required this.acc_name,
    required this.acc_surname,
    required this.acc_verified,
    required this.acc_creation_date
  });


  factory SearchUsers.fromJson(Map<String, dynamic> json) => SearchUsers(
      acc_id : json["acc_id"],
      acc_mail: json["acc_mail"],
      acc_name : json["acc_name"],
      acc_surname : json["acc_surname"],
      acc_verified : json["acc_verified"],
      acc_creation_date : json["acc_creation_date"]
  );

  Map<String, dynamic> toJson() => {
    "acc_id" : acc_id,
    "acc_mail" : acc_mail,
    "acc_name" : acc_name,
    "acc_surname" : acc_surname,
    "acc_verified" : acc_verified,
    "acc_creation_date" : acc_creation_date
  };
}