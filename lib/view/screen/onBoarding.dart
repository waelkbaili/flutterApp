import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstapp/controller/onBoardingController.dart';
import 'package:firstapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//never use stateful widget with getx
class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller Injection
    OnBoardingControllerImp controller= Get.put(OnBoardingControllerImp());
    return Scaffold(body:
    //marge top under camera
    SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
            controller: controller.pageController,
            //page number
            onPageChanged: (value) => {
              controller.onChange(value)
            },
            itemCount: onBoardingList.length,
             itemBuilder: (context,i)=>
             Column(children: [
              const SizedBox(height: 30,),
              Text( onBoardingList[i].title!, style:Theme.of(context).textTheme.headline1,),
              const SizedBox(height: 100,),
              Image.asset(onBoardingList[i].image!),
              const SizedBox(height: 100,),
              Text(onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,),
             ],)
             ),
             ),
             Expanded(
              flex: 1,
              child: Column(children: [
               GetBuilder<OnBoardingControllerImp>(builder: (controller)=>
               // ignore: unnecessary_new
               new DotsIndicator(
                    dotsCount: onBoardingList.length,
                    position: controller.currect_page.toDouble(),
                  ),
                /*Row(mainAxisAlignment: MainAxisAlignment.center,children: 
                  List.generate(onBoardingList.length,
                   (index)=>AnimatedContainer(
                    margin: const EdgeInsets.all(10),
                    height: controller.currect_page==index ? 10 :5,
                    width: controller.currect_page==index ? 10 :5,
                    decoration: BoxDecoration(color: controller.currect_page==index ? ColorApp.primary :ColorApp.grey,
                    borderRadius: BorderRadius.circular(20)
                    ),
                    duration: const Duration(milliseconds: 6))
                    )
                ,),*/
                ),
                //Spacer : big marge to the buttom
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(onPressed: (){
                    controller.next();
                  }, child: const Text("Skip"))
                  )
             ],)
             )
        ],
      ),
    )
       );
  }
}