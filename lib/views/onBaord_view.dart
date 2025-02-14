import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/custom_widget/custom_Text.dart';
import 'package:oceanakabab/views/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../controllers/onBoardingController.dart';
import '../custom_widget/rounded_button.dart';
import 'bottombar_view.dart';

class OnbaordView extends StatelessWidget {
   OnbaordView({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: PageView.builder(
          onPageChanged: (int index){
            controller.currentIndex = index;
          },
          controller: controller.myController,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child:  Image(image: controller.imgList[index],fit: BoxFit.cover,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.headerTextList[index],style: commonDesigns.headingText,),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.sizeOf(context).width/1.6,
                  child:  Text(controller.subTextList[index],style: commonDesigns.subHeaddingText,),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller.myController!,
                    count: 3,
                    effect: WormEffect(
                      // dotWidth: controller.currentIndex == index ? 15 : 10,
                      // dotHeight: 10,
                      activeDotColor: primaryColor,
                      type: WormType.normal
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                RoundedButton(
                  onTap: (){
                    controller.getResult();
                  },
                  text: 'Next',
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    controller.generateUid(context);
                  },
                  child: CustomText(
                    customColor: Colors.black54,
                    customFontSize: 16,
                    customText: "Skip",
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
