import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/common/app_manager.dart';
import 'package:oceanakabab/views/bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginController  extends GetxController{

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

      // Update AppManager and navigate
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
}