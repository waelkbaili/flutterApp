import 'dart:convert';
import 'package:firstapp/data/model/userModel.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static String baseUrl="http://192.168.1.103/tutoriel/laravel_api/api/v1";
  static var client =http.Client();

  static login({required email,required password}) async {
    var response =await client.post(
      Uri.parse("$baseUrl/login") ,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(<String,String>{"email":email,"password":password}));

      if(response.statusCode == 200){
        var stringObject=response.body;
        var user=userFromJson(stringObject);
        return user;
      }
     // else{
      //  return null;
      //}
  }

  
}