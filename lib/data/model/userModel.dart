import 'dart:convert';

UserModel userFromJson(String str) =>UserModel.fromJsonToObject(json.decode(str));

class UserModel{
  User user;
  String status;
  
  UserModel({required this.user,required this.status});

  factory UserModel.fromJsonToObject(Map<String,dynamic> json) =>
  UserModel(user: User.fromJsonToObject(json["data"]), status: json["status"]);

    Map<String,dynamic> toJsonFromObject()=> {
        "data": user.toJsonFromObject(),
        "status": status,
  };

}

class User{
  int id;
  String email;
  String name;
  String gender;
  // ignore: non_constant_identifier_names
  String date_birth;
  String address;
  String country;
  String image;
  String rate;
  String token;

  User({required this.id,required this.email,required this.name,required this.gender,
        // ignore: non_constant_identifier_names
        required this.date_birth,required this.address,required this.country,
        required this.image,required this.rate,required this.token,});

  factory User.fromJsonToObject( Map<String,dynamic> json) => 
    User(id: json["id"], email: json["email"],name:json["name"], gender: json["gender"],
          date_birth: json["date_birth"],address: json["address"], country: json["country"], 
          image: json["img"],rate: json["rate"], token: json["token"]);

  Map<String,dynamic> toJsonFromObject()=> {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "date_birth": date_birth,
        "address": address,
        "country": country,
        "rate": rate,
        "img": image,
        "token": token
  };

}