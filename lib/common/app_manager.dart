import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/uuid.dart';
  class AppManager{

  static String guestUid = "";

  static Function? update;


  static getInfoMessage(BuildContext context, String txt) {
    AnimatedSnackBar.material(
      txt,
      type: AnimatedSnackBarType.info,
      duration: const Duration(seconds: 5),
    ).show(context);
  }

  static getErrorMessage(BuildContext context, String txt) {
    AnimatedSnackBar.material(
      txt,
      type: AnimatedSnackBarType.error,
      duration: const Duration(seconds: 5),
      // Position of snackbar on mobile devices
    ).show(context);
  }

  static successMessageToast(BuildContext context, String txt) {
    toastification.show(
      style: ToastificationStyle.fillColored,
      type: ToastificationType.success,
      context: context,
      title: Text(txt),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  static errorMessageToast(BuildContext context, String txt) {
    toastification.show(
      style: ToastificationStyle.fillColored,
      type: ToastificationType.error,
      context: context,
      title: Text(txt),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}