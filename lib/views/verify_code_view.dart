import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oceanakabab/common/app_colors.dart';
import 'package:oceanakabab/views/bottombar_view.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';
import 'package:pinput/pinput.dart';

import 'home_view.dart';
import 'login_view.dart';

class VerifyCodeView extends StatelessWidget {
   VerifyCodeView({Key? key}) : super(key: key);

   PinInputController pinInputController = PinInputController(length: 4);


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 8),
      textStyle: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color:Colors.black45,width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
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
                                Get.to(BottombarView());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Verification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'We have sent a code to your email',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'test@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 190),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: ListView(
                    children: [
                      SizedBox(height: 45,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Text(
                              'CODE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            const Text(
                              'Resend in 50sec',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                      //   child:  Pinput(
                      //     defaultPinTheme: defaultPinTheme,
                      //     focusedPinTheme: defaultPinTheme,
                      //     submittedPinTheme: defaultPinTheme,
                      //     validator: (s) {
                      //       return s == '2222' ? null : 'Pin is incorrect';
                      //     },
                      //     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      //     showCursor: true,
                      //     onCompleted: (pin) => print(pin),
                      //   ),
                      // ),
                      // const SizedBox(height: 30),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: ElevatedButton(
                      //       onPressed: () {
                      //         Get.to(LoginScreen());
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: primaryColor,
                      //         padding: const EdgeInsets.symmetric(vertical: 16),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //       ),
                      //       child: const Text(
                      //         'VERIFY',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 30),

                      PinPlusKeyBoardPackage(
                        keyboardButtonShape: KeyboardButtonShape.rounded,
                        inputShape: InputShape.defaultShape,
                        keyboardMaxWidth: 100,
                        inputHeight: 50,
                        isInputHidden: false,
                        inputTextColor: primaryColor,
                        inputWidth: 55,
                        inputBorderRadius: BorderRadius.circular(11),
                        inputHasBorder: true,
                        inputFillColor: Colors.white,
                        inputElevation: 3,
                        buttonFillColor: Colors.black,
                        btnTextColor: Colors.white,
                        spacing: MediaQuery.sizeOf(context).height*0.2,
                        pinInputController: pinInputController,
                        onSubmit: () {
                          /// ignore: avoid_print
                          print("Text is : " + pinInputController.text);
                        }, keyboardFontFamily: '',
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



