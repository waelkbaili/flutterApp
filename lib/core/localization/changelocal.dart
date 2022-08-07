import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  Locale? language;
  MyServices myServices=Get.find();

  changeLanguage(String codeLang){
    Locale locale=Locale(codeLang);
    myServices.sharedPreferences.setString("lang", codeLang);
    Get.updateLocale(locale);
    Get.offAllNamed(AppRoutes.onBoarding);
  }

  @override
  void onInit() {
    if(myServices.sharedPreferences.getString("lang")=="fr"){
      language=const Locale("fr");
    }
    else if(myServices.sharedPreferences.getString("lang")=="en"){
      language=const Locale("en");
    }
    else{
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}