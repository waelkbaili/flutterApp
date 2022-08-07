import 'package:firstapp/core/constant/color.dart';
import 'package:firstapp/core/localization/changelocal.dart';
import 'package:firstapp/core/localization/translation.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:firstapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  //service initialisation
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //injection language controller
    LocalController controller= Get.put(LocalController());
    //GetMaterielApp because we use GETX
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          bodyText1: TextStyle(height: 2,color: ColorApp.grey)
        ),
        primaryColor: Colors.blue,
      ),
      
      getPages: routes,
      translations: Translate(),
      locale: controller.language,
    );
  }
}

