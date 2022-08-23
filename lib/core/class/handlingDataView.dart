import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataView({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     statusRequest==StatusRequest.loading?
     Center(child: Lottie.asset(ImageAssets.loadingLottie,width: 100,height: 100)):
   statusRequest==StatusRequest.failure?
    widget:
    statusRequest==StatusRequest.serverfailure?
     Center(child: Lottie.asset(ImageAssets.serverLottie,width: 100,height: 100)):
    statusRequest==StatusRequest.offlinefailure?
     Center(child: Lottie.asset(ImageAssets.offlineLottie,width: 100,height: 100)):
    widget;
    
  }
}