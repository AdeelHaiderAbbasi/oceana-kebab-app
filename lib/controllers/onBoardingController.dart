
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/views/welcome_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../common/app_manager.dart';
import '../common/app_strings.dart';
import 'package:flutter/material.dart';

import '../views/bottombar_view.dart';
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


  void generateUid(BuildContext context) async {
    // Check if UID already exists in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUid = prefs.getString('guestUid');

    if (savedUid == null || savedUid.isEmpty) {
      // Generate a new UID
      Uuid uuid = Uuid();
      String uid = uuid.v4(); // Generates a version 4 (random) UUID
      print("Generated UID: $uid");

      // Save the UID to SharedPreferences
      await prefs.setString('guestUid', uid);

      // // Update AppManager and navigate
      // AppManager.guestUid = uid;
       Get.forceAppUpdate();
      Get.to(BottombarView());
      AppManager.getInfoMessage(context, "GuestId saved for this user: $uid");
    } else {
      // UID already exists, navigate to home screen
      // AppManager.guestUid = savedUid; // Update AppManager with the saved UID
      Get.to(BottombarView());
      AppManager.getInfoMessage(context, "GuestId already exists: $savedUid");
    }
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