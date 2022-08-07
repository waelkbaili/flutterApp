import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:firstapp/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onChange(int val);
}

class OnBoardingControllerImp extends OnBoardingController{
  int currect_page=0;
  late PageController pageController;
  MyServices myServices=Get.find();
  @override
  next() {
    currect_page++;
    if(currect_page>onBoardingList.length-1){
      myServices.sharedPreferences.setString("firsttime", "1");
      //move to another page without back
      Get.offAllNamed(AppRoutes.login);
    }
    else{
    pageController.animateToPage(
      currect_page, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onChange(int val) {
   currect_page=val;
   update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController=PageController();
  }

}