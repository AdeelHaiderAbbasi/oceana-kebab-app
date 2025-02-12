import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/common/app_colors.dart';

import '../custom_widget/custom_inputs_fields.dart';
import 'login_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                color: Color(0xFF0a173b),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please sign up to get started',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
               Container(
                 margin: EdgeInsets.symmetric(vertical: 160),
                 width: MediaQuery.sizeOf(context).width,
                 height: MediaQuery.sizeOf(context).height,
                 decoration: BoxDecoration(
                   color: Colors.grey.shade200,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                 ),
                 child: ListView(
                   children: [
                     SizedBox(height: 25,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: const CustomInputField(
                         label: 'NAME',
                         hintText: 'John doe',
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: const CustomInputField(
                         label: 'EMAIL',
                         hintText: 'example@gmail.com',
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: const CustomPasswordField(
                         label: 'PASSWORD',
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: const CustomPasswordField(
                         label: 'RE-TYPE PASSWORD',
                       ),
                     ),
                     const SizedBox(height: 30),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                           onPressed: () {
                             Get.to(LoginScreen());
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: primaryColor,
                             padding: const EdgeInsets.symmetric(vertical: 16),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8),
                             ),
                           ),
                           child: const Text(
                             'SIGN UP',
                             style: TextStyle(
                               fontSize: 16,
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),
                     const SizedBox(height: 12),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text(
                           "Already have an account? ",
                           style: TextStyle(color: Colors.black),
                         ),
                         TextButton(
                           onPressed: () {Get.to(LoginScreen());},
                           child: const Text(
                             'SIGN IN',
                             style: TextStyle(
                               color: Colors.deepOrange,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ],
                 )
               )
            ],
          ),
        ),
      ),
    );
  }
}



