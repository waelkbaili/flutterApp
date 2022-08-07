import 'package:firstapp/controller/auth/signUpController.dart';
import 'package:firstapp/core/function/validInput.dart';
import 'package:firstapp/view/widget/language/button.dart';
import 'package:firstapp/view/widget/login/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp signupCntrol=Get.put(SignUpControllerImp());
    return Scaffold(
      
      body:Form(
        key: signupCntrol.formstateSignUp,
        child: Container(margin: EdgeInsets.all(20),
          child: 
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              FormText(hintText: "Enter your email", labelText: "Email", 
              iconData: Icons.email,isNumber: false,
              mycontroller: signupCntrol.email,valid: (val){return validInput(val!, 5, 20, "email");}
              ),
               FormText(hintText: "Enter your username", labelText: "Username", 
              iconData: Icons.person,isNumber: false,
              mycontroller: signupCntrol.username,valid: (val){return validInput(val!, 5, 10, "username");}
              ),
               FormText(hintText: "Enter your adress", labelText: "Adresse", 
              iconData: Icons.place,isNumber: true,
              mycontroller: signupCntrol.adresse,valid: (val){return validInput(val!, 5, 10, "address");}
              ),
             GetBuilder<SignUpControllerImp>(builder: (signupCntrol)=>
              FormText(hintText: "Enter your password", labelText: "Paasword", 
              iconData: Icons.password,scdIcon: Icons.password_outlined,mycontroller: signupCntrol.password,
              valid: (val){return validInput(val!, 5, 20, "password");},
              isNumber: false,onPressed: (){signupCntrol.showPassword();},isObscure: signupCntrol.isShow,)),
              
              Button(text: "SignUp", onPressed: (){
                  signupCntrol.signUp();
              })
      
            ],),
          
        ),
      )
      
    );;
  }
}