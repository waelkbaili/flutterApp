import 'package:firstapp/controller/auth/loginController.dart';
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
      //appBar: AppBar(title: Container(alignment: Alignment.center, child: Text("Login page"),)),
      body:Form(
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
              Obx(()=>controllerImp.isLoading==true? Center(child: CircularProgressIndicator()):Text(""))
              
      
            ],),

          
        ),
      )
      
    );
  }
}