import 'package:firstapp/core/class/crud.dart';
import 'package:firstapp/linkAPI.dart';

class SignUpData{
  Crud crud;
  SignUpData(this.crud);
  tryRegister(String email,String username,String address,String password,
          String country,String gender,String date_birth) async {
    var response=await crud.postData(AppLink.signUpLink, {
      "name" : username,
      "email" : email,
      "address" : address,
      "password" :password,
      "country" : country,
      "date_birth" : date_birth,
      "gender" : gender,
      
    },null);
    return response.fold((l) => l, (r) => r);
  }
}