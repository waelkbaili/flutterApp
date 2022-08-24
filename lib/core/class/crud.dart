import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firstapp/core/class/statusRequest.dart';
import 'package:firstapp/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud{
  Future<Either<StatusRequest,Map>> postData(String link,Map? data,Map<String, String>? headers) async{
    try{
        if(await checkInternet()){
            var response =await http.post(Uri.parse(link),body: data,headers: headers);
            if(response.statusCode==200 || response.statusCode==201){
              Map responseBody=jsonDecode(response.body);
              return Right(responseBody);
            }
            else{
              return const Left(StatusRequest.serverfailure);
                }
            }
            else{
              return const Left(StatusRequest.offlinefailure);
            }
    }
    catch(_){
      return const Left(StatusRequest.serverfailure);
    }
  }
}