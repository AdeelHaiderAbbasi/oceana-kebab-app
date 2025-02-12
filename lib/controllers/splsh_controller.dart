


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oceanakabab/views/onBaord_view.dart';
import '../views/signup_view.dart';

class SplashController extends GetxController{


  @override
  void onInit(){
    Init();
    super.onInit();
  }

  void Init() async {
      Future.delayed( Duration(seconds: 5), () {
        Get.to(OnbaordView());
      });

  }
}