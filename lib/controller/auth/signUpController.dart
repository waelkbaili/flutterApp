import 'package:firstapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class  SignUpController extends GetxController{
  signUp();
}
class SignUpControllerImp extends SignUpController{

   GlobalKey<FormState> formstateSignUp=GlobalKey<FormState>() ;

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController adresse;
  late TextEditingController password;
  bool isShow=true;

  showPassword(){
    isShow=!isShow;
    update();
  }

  @override
  signUp() {
    
    var state=formstateSignUp.currentState;
    if(state!.validate()){
      Get.offAllNamed(AppRoutes.home);
    }
    else{
      
    }
  }

  @override
  void onInit() {
    email=TextEditingController();
    username=TextEditingController();
    adresse=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    username.dispose();
    adresse.dispose();
    password.dispose();
  }
  
}