import 'package:firstapp/controller/auth/signUpController.dart';
import 'package:firstapp/core/class/handlingDataView.dart';
import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/constant/imageassets.dart';
import 'package:firstapp/core/function/validInput.dart';
import 'package:firstapp/view/widget/language/button.dart';
import 'package:firstapp/view/widget/login/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatelessWidget {
  
  const SignUp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp signupCntrol=Get.put(SignUpControllerImp());
    return Scaffold(
      body:GetBuilder<SignUpControllerImp>(builder: (controller) => 
      HandlingDataView(statusRequest: controller.statusRequest, widget: Form(
        key: signupCntrol.formstateSignUp,
        child: Container(margin: const EdgeInsets.all(20),
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
              iconData: Icons.place,isNumber: false,
              mycontroller: signupCntrol.adresse,valid: (val){return validInput(val!, 5, 10, "address");}
              ),
             GetBuilder<SignUpControllerImp>(builder: (signupCntrol)=>
              FormText(hintText: "Enter your password", labelText: "Paasword", 
              iconData: Icons.password,scdIcon: Icons.password_outlined,mycontroller: signupCntrol.password,
              valid: (val){return validInput(val!, 5, 20, "password");},
              isNumber: false,onPressed: (){signupCntrol.showPassword();},isObscure: signupCntrol.isShow,
              )
              ),
                GetBuilder<SignUpControllerImp>(builder: (signupCntrol)=>
                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                   child: DropdownButton(
                    hint:Row(children: const [
                      Icon(Icons.flag,color: Colors.grey,),
                      SizedBox(width: 12),
                      Text("choose country"),
                    ]),
                    items: ["1","2","3"]
                    .map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList()
                    , onChanged: (country){
                     signupCntrol.chooseCountry(country);
                    },  value: signupCntrol.countrySelected,
                    isExpanded: true,
                    ),
                 ),
                ),
                GetBuilder<SignUpControllerImp>(builder: (signupCntrol)=>
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  const Icon(Icons.person),
                  Text("male"),
                   Radio(value: "male", groupValue: signupCntrol.genderSelected, onChanged: (val){
                    signupCntrol.chooseGender(val);
                   }),
                   Text("female"),
                   Radio(value: "female", groupValue: signupCntrol.genderSelected, onChanged: (val){
                    signupCntrol.chooseGender(val);
                   }),
                 ],
               )
               ), 
                
              Button(text: "SignUp", onPressed: (){
                  signupCntrol.signUp();
              })
      
            ],),
            
          
        ),
      ))
      )
      
      
    );
  }
}