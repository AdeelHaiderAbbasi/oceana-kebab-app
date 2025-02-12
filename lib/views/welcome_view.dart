
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/views/login_view.dart';
import 'package:oceanakabab/views/signup_view.dart';
import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../custom_widget/rounded_button.dart';
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/Picture1.png"),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome",style: commonDesigns.headingText,),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have a Better Sharing Experience",style: commonDesigns.buttonText3,),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                onTap: () {
                Get.to(SignupView());
              }, text: 'Created an account',)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: Text('Login',style: commonDesigns.subHeaddingText,),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(300, 52),
                  maximumSize: Size(300, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  side: BorderSide(color: secondaryColor2,width: 2),
                  foregroundColor: primaryColor,
                ),
                onPressed: () {
                  Get.to(LoginScreen());
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}
