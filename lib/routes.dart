import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/middleware/middlewareAuth.dart';
import 'package:firstapp/core/middleware/myMiddleware.dart';
import 'package:firstapp/view/home.dart';
import 'package:firstapp/view/screen/auth/login.dart';
import 'package:firstapp/view/screen/auth/signup.dart';
import 'package:firstapp/view/screen/language.dart';
import 'package:firstapp/view/screen/onBoarding.dart';
import 'package:get/get.dart';



List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(),middlewares: [
    MyMiddleWare()
    ]),
   GetPage(name: AppRoutes.login, page: () => const Login(),middlewares: [
    MyMiddleWareAuth()
    ]),
   GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
   GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
   GetPage(name: AppRoutes.home, page: () => const Home()),

];