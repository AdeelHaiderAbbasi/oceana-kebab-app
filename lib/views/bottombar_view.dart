import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oceanakabab/common/app_colors.dart';
import 'package:oceanakabab/common/app_manager.dart';
import 'package:oceanakabab/views/home_view.dart';
import 'package:oceanakabab/views/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:intl/intl.dart';

import 'order_history_view.dart';

class BottombarView extends StatefulWidget {
  const BottombarView({super.key});

  @override
  State<BottombarView> createState() => _BottombarViewState();
}

class _BottombarViewState extends State<BottombarView> {

  String? guestsUid;

  Future<void> loadGuestUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      guestsUid = prefs.getString('guestUid');
      AppManager.guestUid = guestsUid??"";
    });

    if (guestsUid != null) {
      print("Retrieved UID from SharedPreferences: $guestsUid");
      // Use the UID as needed
    } else {
      print("No UID found in SharedPreferences");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    loadGuestUid();
    super.initState();
  }

  int myIndex = 0;
  final pageController = PageController();
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  List<Widget> widgetOptions = <Widget>[
   HomeScreen(),
    MyOrdersScreen(),
    ProfileScreen()
  ];

  void setupPage(int index) {
    myIndex = index;
    setState(() {

    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetOptions.elementAt(myIndex),
        extendBody: true,
        bottomNavigationBar:  TitledBottomNavigationBar(
            enableShadow: true,
            inactiveStripColor: Colors.grey.shade50,
            inactiveColor: Colors.black38,
            activeColor: primaryColor,
            currentIndex: myIndex, // Use this to update the Bar giving a position
            onTap: (index){
              setupPage(index);
            },
            items: [
              TitledNavigationBarItem(
                  title: Text('DASHBOARD',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),), icon: Icon(Icons.home)
              ),
              TitledNavigationBarItem(
                  title: Text('HISTORY',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),), icon: Icon(Icons.history)
              ),
              // TitledNavigationBarItem(
              //     title: Text('CONTACT',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),), icon: Icon(Icons.contact_mail)
              // ),
              TitledNavigationBarItem(
                  title: Text('PROFILE',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),), icon: Icon(Icons.settings)
              ),
            ]
        )
    );
  }

  static var customFont = GoogleFonts.agdasima(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 23,
          letterSpacing: 1,
          fontWeight: FontWeight.bold));

  // void categoryScreen(BuildContext context) {
  //   showSlidingBottomSheet(context, builder: (context) {
  //     return SlidingSheetDialog(
  //       elevation: 8,
  //       cornerRadius: 16,
  //       snapSpec: const SnapSpec(
  //         snap: true,
  //         snappings: [0.4, 0.7, 1.0],
  //         positioning: SnapPositioning.relativeToAvailableSpace,
  //       ),
  //       builder: (context, state) {
  //         return Container(
  //           color: Colors.white,
  //           height: 400,
  //           child: Center(
  //             child: Material(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(20.0),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         InkWell(
  //                             onTap: (){
  //                               close();
  //                             },
  //                             child: Icon(Icons.close,color: Colors.black,size: 25,)),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "ADD NEW BOOK",
  //                             style: customFont2,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Divider(
  //                       thickness: 1,
  //                       color: Colors.black38,
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     TextField(
  //                       controller: bookCtrl,
  //                       keyboardType: TextInputType.text,
  //                       cursorColor: Colors.green.shade800,
  //                       cursorHeight: 20,
  //                       decoration: InputDecoration(
  //                           filled: true,
  //                           fillColor: Color.fromRGBO(246, 248, 250, 1),
  //                           labelText: "ENTER BOOK",
  //                           labelStyle:
  //                           TextStyle(color: Colors.grey.shade900),
  //                           contentPadding:
  //                           EdgeInsets.fromLTRB(10, 16, 32, 16),
  //                           enabledBorder: OutlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: Colors.grey.shade400),
  //                             borderRadius: BorderRadius.circular(7),
  //                           ),
  //                           focusedBorder: OutlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 width: 1, color: Colors.blue.shade800),
  //                             borderRadius: BorderRadius.circular(7),
  //                           )),
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Divider(
  //                       color: Colors.grey.shade200,
  //                       thickness: 1,
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(bottom: 10.0),
  //                       child: MaterialButton(
  //                         disabledElevation: 2,
  //                         disabledColor: Colors.grey,
  //                         color: Colors.blue.shade800,
  //                         minWidth: 320,
  //                         height: 60,
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius:
  //                             BorderRadius.all(Radius.circular(8))),
  //                         onPressed: () {
  //                           saveNewBook(context);
  //                         },
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Text(' SAVE BOOK', style: customFont99),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   });
  //   // This is the result.
  // }

  static var customFont99 = GoogleFonts.agdasima(
      textStyle: TextStyle(
          color: Color.fromRGBO(241, 188, 177, 1),
          fontSize: 15,
          letterSpacing: 1,
          fontWeight: FontWeight.bold));

  static var customFont2 = GoogleFonts.abel(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          letterSpacing: 0.1,
          fontWeight: FontWeight.bold));
}

