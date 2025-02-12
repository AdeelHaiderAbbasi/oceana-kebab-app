
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/views/welcome_view.dart';

import '../common/app_strings.dart';
import 'package:flutter/material.dart';
class OnBoardingController extends GetxController{
  int currentIndex = 0;

  final controller = PageController();
    PageController?  myController;
  List<dynamic> subTextList = [onBoardSubText1,onBoardSubText2,onBoardSubText3];

  List<dynamic> headerTextList = [headerText1,headerText2,headerText3];


  List imgList = [
    const AssetImage('assets/images/onb2.png'),
    const AssetImage('assets/images/Picture12.png'),
    const AssetImage('assets/images/Picture8.png'),
  ];


  void onInit(){
    super.onInit();
    myController = PageController(initialPage: 0);
    update();
  }


  void getResult(){
    if (currentIndex == 2) {
      print(currentIndex);
      Get.to(WelcomeView());
    }
    else{
      myController?.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
      update();
    }
  }

}