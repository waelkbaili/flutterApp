import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/authService.dart';
import 'package:firstapp/core/service/services.dart';
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
  var isLoading=false.obs;
  MyServices myServices=Get.find();

  showPassword(){
    isShow=!isShow;
    update();
  }
  @override
  login() async {
    var state=formstate.currentState;
    if(state!.validate()){
      isLoading(true);
      try{
        var data=await AuthService.login(email: email.text, password: password.text);
        
        if(data != null){
          var verif=data.toString().contains('status');
          if(!verif){
            myServices.sharedPreferences.setString("token", data.user.token);
            formstate.currentState!.save();
            Get.snackbar("success", "bravo");
            Get.toNamed(AppRoutes.home);
          }
          else{
             Get.snackbar("echec", data.toString().substring(11,data.toString().length-2));
          } 
        }
        else{
          Get.snackbar("echec", "something went wrong");
        }

      }
      finally{
        //Get.snackbar("echec", "erroe");
        isLoading(false);
      }
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