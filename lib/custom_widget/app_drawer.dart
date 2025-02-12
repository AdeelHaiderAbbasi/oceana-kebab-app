// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class DrawerScreen extends StatelessWidget {
//    DrawerScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.grey.shade100,
//       child: ListView(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.close,
//                     color: primaryColor,
//                     size: 40,
//                   ),
//                   Text(
//                     "Close menu",
//                     style: commonDesigns.subHeaddingText,
//                   ),
//                 ],
//               ),
//                const SizedBox(height: 10,),
//                RichText(
//                  text:  TextSpan(
//                  text: "HISAB",
//                  style: GoogleFonts.ubuntu(
//                    color: secondaryColor3,
//                    fontSize:40,
//                    letterSpacing: 1,
//                    fontWeight: FontWeight.bold
//                  ),
//                  children: <TextSpan>[
//                    TextSpan(
//                        text: 'RAKH', style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.w400,
//                      color: primaryColor,
//                      fontSize: 40,
//                      letterSpacing: 1
//                    )
//                    ),
//                  ],
//                ),
//                ),
//                  InkWell(
//                    onTap: (){Get.to(DashboardScreen(),transition: Transition.upToDown);},
//                    child: Container(
//                      margin: const EdgeInsets.all(5),
//                      width: MediaQuery.sizeOf(context).width,
//                      height: 50,
//                      decoration: const BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.all(Radius.circular(16))
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          const Padding(
//                            padding: EdgeInsets.all(10.0),
//                            child: Icon(Icons.dashboard,size: 28,color: primaryColor,),
//                          ),
//                          Text("Dashboard",style: commonDesigns.subHeaddingText90,),
//                        ],
//                      ),
//                    ),
//                  ),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.goalView);}, text: "Savings and Goals", icon: Icons.savings_sharp),
//               const SizedBox(height: 10,),
//               customContainerDrawer(onTap: (){myController.gotoGoalScreen();}, text: "Ledger", icon: Icons.book),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.loanList);}, text: "Loan", icon: Icons.money),
//               customContainerDrawer(onTap: (){myController.gotoGoalScreen();}, text: "Shared Expense", icon: Icons.share_sharp),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.accountDetail);}, text: "Accounts", icon: Icons.account_balance_outlined),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.overview);}, text: "Overview", icon: Icons.history_edu_outlined),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.suggestion);}, text: "Suggestion", icon: Icons.settings_suggest),
//               Divider(color: Colors.grey.shade200,thickness: 1,),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.login);}, text: "Share app", icon: Icons.share),
//               customContainerDrawer(onTap: (){myController.gotoGoalScreen();}, text: "Rate app", icon: Icons.rate_review),
//               customContainerDrawer(onTap: (){Get.toNamed(AppRoutes.settingscreen);}, text: "App Settings", icon: Icons.settings),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
