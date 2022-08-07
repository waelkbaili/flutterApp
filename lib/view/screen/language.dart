import 'package:firstapp/core/localization/changelocal.dart';
import 'package:firstapp/view/widget/language/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container( margin: const EdgeInsets.symmetric(horizontal: 50), width: double.infinity, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("chnglng".tr,style:Theme.of(context).textTheme.headline1),
        const SizedBox(height:20),
        Button(text:"fr",onPressed: (){
            controller.changeLanguage("fr");
        },),
        Button(text:"en",onPressed: (){
            controller.changeLanguage("en");
        },),
      ],)
      ),
    );
  }
}