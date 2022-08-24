import 'package:firstapp/core/class/crud.dart';
import 'package:firstapp/linkAPI.dart';

class LogoutData{
  Crud crud;
  LogoutData(this.crud);
  tryLogout(String? token) async {
    var headers={
      'Accept':'application/json',
      'responseType':'text',
      'Authorization':'Bearer $token'
    };
    var response=await crud.postData(AppLink.logoutLink, null,headers);
    return response.fold((l) => l, (r) => r);
  }
}