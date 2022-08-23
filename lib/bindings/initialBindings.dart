import 'package:firstapp/core/class/crud.dart';
import 'package:get/get.dart';

class initialBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Crud());
  }
  
}