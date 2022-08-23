import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/function/checkInternet.dart';
import 'package:firstapp/data/datasource/remote/auth/signupdata.dart';
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
  late var countrySelected=null;
  late var genderSelected=null;
  StatusRequest? statusRequest;
  SignUpData signUpData=SignUpData(Get.find());
  

  showPassword(){
    isShow=!isShow;
    update();
  }

  chooseCountry(var country){
    countrySelected=country;
    update();
  }

  chooseGender(var gender){
    genderSelected=gender;
    update();
  }

  @override
  signUp() async{
    
    var state=formstateSignUp.currentState;
    if(state!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await signUpData.tryRegister(email.text, username.text, adresse.text, password.text,
                       countrySelected, genderSelected, "date_birth");
      if(response is StatusRequest){
        statusRequest=response;
      }
      else{
        if(response['status']=='succes'){
          statusRequest=StatusRequest.success;
          Get.offAllNamed(AppRoutes.login);
        }
        else{
          statusRequest=StatusRequest.failure;
          Get.snackbar("Warning", response['status']);
        }
      }
    }
    else{}
    update();
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