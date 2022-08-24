import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/constant/routes.dart';
import 'package:firstapp/core/service/services.dart';
import 'package:firstapp/data/datasource/remote/auth/logoutData.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
  logout();
}

class HomeControllerImp extends HomeController{

  StatusRequest? statusRequest;
   MyServices myServices=Get.find();
  LogoutData logoutData=LogoutData(Get.find());
  String? token;
  @override
  logout() async {
    //print("object");
    token=myServices.sharedPreferences.getString('token');
    var response=await logoutData.tryLogout(token);
    if(response is StatusRequest){
        statusRequest=response;
      }
      else{
        if(response['status']=='logout'){
          statusRequest=StatusRequest.success;
          myServices.sharedPreferences.remove('token');
          Get.snackbar("success", "bravo");
          Get.offNamed(AppRoutes.login);
        }
        else{
          statusRequest=StatusRequest.failure;
          Get.snackbar("Warning", 'something wrong');
        }
      }
    update();
    // TODO: implement logout
    
  }

}