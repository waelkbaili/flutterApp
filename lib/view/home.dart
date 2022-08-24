import 'package:firstapp/controller/homeController.dart';
import 'package:firstapp/view/widget/language/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     Get.put(HomeControllerImp());
    return Scaffold(
      
      body: GetBuilder<HomeControllerImp>(builder: (controllerImp) => 
      Container(
        child: Center(child: Button(onPressed:(){controllerImp.logout();} , text: 'Logout',)),
        
      ),
      ) 
    );
  }
}