import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWareAuth extends GetMiddleware{

  MyServices myServices=Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString("token")!=null){
      return const RouteSettings(name:AppRoutes.home);
    }
  } 
}