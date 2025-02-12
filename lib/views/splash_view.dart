import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oceanakabab/controllers/splsh_controller.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SplashController>(builder: ( controller) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.jpg",width: 200,height: 200,),
              SizedBox(height: 15,),
              LoadingAnimationWidget.threeArchedCircle(
                size: 35, color: Color(0xFF1A1A3F),
              ),
              SizedBox(height: 50,),
              //Text("Powered By: Afaq Ahmad",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)
            ],
          ),
        );
      },

      ),
    );
  }
}
