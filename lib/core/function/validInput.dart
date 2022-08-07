import 'package:get/get.dart';

validInput(String val,int min,int max,String type){

  if(val.isEmpty){
    return "can't be empty";
  }

  if(val.length<min){
    return "too short";
  }

  if(val.length>max){
    return "too long";
  }

  if(type=="username"){
    if(! GetUtils.isUsername(val)){
      return "not valid username";
    }
  }

  if(type=="email"){
    if(! GetUtils.isEmail(val)){
      return "not valid email";
    }
  }

  

  

  
}