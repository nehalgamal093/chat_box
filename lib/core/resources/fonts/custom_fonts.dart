import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomFonts {
  static TextStyle medium10({Color fontColor = ColorsManager.whiteColor}) {
    return GoogleFonts.cabin(
        fontSize: 20, fontWeight: FontWeight.w700, color: fontColor);
  }
  static TextStyle medium9({Color fontColor = ColorsManager.whiteColor}) {
    return GoogleFonts.cabin(
        fontSize: 17, fontWeight: FontWeight.w700, color: fontColor);
  }
  static TextStyle medium7({Color fontColor = ColorsManager.whiteColor}) {
    return GoogleFonts.cabin(
        fontSize: 15, fontWeight: FontWeight.w800, color: fontColor);
  }

  static TextStyle small10({Color fontColor = ColorsManager.whiteColor}) {
    return GoogleFonts.cabin(
        fontSize: 14, fontWeight: FontWeight.w500, color: fontColor);
  }
  static TextStyle small9({Color fontColor = ColorsManager.whiteColor}) {
    return GoogleFonts.cabin(
        fontSize: 12, fontWeight: FontWeight.w400, color: fontColor);
  }
}
