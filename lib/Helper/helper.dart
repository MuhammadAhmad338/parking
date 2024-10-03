import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parking/Helper/colors.dart';

class Helper {
  static setHeight(BuildContext context, {height = 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static setWidth(BuildContext context, {width = 1}) {
    return MediaQuery.of(context).size.width * width;
  }

  // static toScreen(context, screen) {
  //   return Navigator.push(context, SlideRightToLeft(page: screen));
  // }

  static toReplacementScreen(context, screen) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  // static toReplacementScreenRight(context, screen) {
  //   Navigator.pushReplacement(context, SlideLeftToRight(page: screen));
  // }

  static showSnack(context, message,
      {color = CColors.blueColor, duration = 4}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: color,
        duration: Duration(seconds: duration)));
  }

  static circulProggress() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(CColors.blueColor),
      ),
    );
  }

  static showLog(message) {
    log("APP SAYS: $message");
  }

  static showCircularProgressIndicator(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => circulProggress());
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static String formatedDate(DateTime date,
      {String dateFormat = "dd-MM-yyyy"}) {
    DateFormat format = DateFormat(dateFormat);
    return format.format(date);
  }

  static String formatedTime(DateTime date) {
    DateFormat format = DateFormat("hh:mm a");
    return format.format(date);
  }

  // static translate(key, context) {
  //   return AppLocalizations.of(context)!.translate(key);
  // }

  static void changeLanguage(locale) {
    Locale locale0 = const Locale('en', '');
    if (locale0.languageCode == 'en') {
      locale0 = const Locale('de', '');
    } else {
      locale0 = const Locale('en', '');
    }
  }
}
