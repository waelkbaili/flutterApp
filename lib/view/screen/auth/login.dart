import 'package:firstapp/controller/auth/loginController.dart';
import 'package:firstapp/core/class/handlingDataView.dart';
import 'package:firstapp/core/function/validInput.dart';
import 'package:firstapp/view/widget/language/button.dart';
import 'package:firstapp/view/widget/login/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
     LoginControllerImp controllerImp= Get.put(LoginControllerImp());
    return Scaffold(
      body:GetBuilder<LoginControllerImp>(builder: (controller) => 
      HandlingDataView(statusRequest: controller.statusRequest,
       widget: Form(
        key: controllerImp.formstate,
        child: Container(margin: EdgeInsets.all(20),
          child: 
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              FormText(hintText: "Enter your email", labelText: "Email", 
              iconData: Icons.email,mycontroller: controllerImp.email,isNumber: false,
              valid: (val){ return validInput(val!, 5, 30, "email");},),
              GetBuilder<LoginControllerImp>(builder: (controllerImp)=>
              FormText(hintText: "Enter your password", labelText: "Paasword", 
              iconData: Icons.password,scdIcon: Icons.password_outlined,mycontroller: controllerImp.password,
              valid: (val){return validInput(val!, 4, 20, "password");},
              isNumber: false,onPressed: (){controllerImp.showPassword();},isObscure: controllerImp.isShow,)),
              Button(text: "Login", onPressed: (){
                  controllerImp.login();
              }),
              TextButton(onPressed: (){
                controllerImp.signUp();
              }, child: Text("Sign Up")),
            ],),
        ),
      )
      ),
      )
      
    );
  }
}