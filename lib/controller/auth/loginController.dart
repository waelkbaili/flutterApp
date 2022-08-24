import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/authService.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:firstapp/data/datasource/remote/auth/loginData.dart';
import 'package:firstapp/view/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class  LoginController extends GetxController{
  login();
  signUp();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate=GlobalKey<FormState>() ;
  late TextEditingController email;
  late TextEditingController password;
  bool isShow=true;

  //var isLoading=false.obs;
  MyServices myServices=Get.find();

    StatusRequest? statusRequest;
  LoginData loginData=LoginData(Get.find());

  showPassword(){
    isShow=!isShow;
    update();
  }
  @override
  login() async {
    var state=formstate.currentState;
    if(state!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await loginData.tryLogin(email.text, password.text);
      if(response is StatusRequest){
        statusRequest=response;
      }
      else{
        if(response['status']=='succes'){
          statusRequest=StatusRequest.success;
          myServices.sharedPreferences.setString("token", response['data']['token']);
          Get.snackbar("success", "bravo");
          Get.offNamed(AppRoutes.home);
        }
        else{
          statusRequest=StatusRequest.failure;
          Get.snackbar("Warning", response['status']);
        }
      }
      update();
    }
    else{
      print("not valid");
    }
  }

  @override
  signUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
  
}