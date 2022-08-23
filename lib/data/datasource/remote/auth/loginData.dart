import 'package:firstapp/core/class/crud.dart';
import 'package:firstapp/linkAPI.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  tryLogin(String email,String password,) async {
    var response=await crud.postData(AppLink.loginLink, {
      "email" : email,
      "password" :password,
    });
    return response.fold((l) => l, (r) => r);
  }
}