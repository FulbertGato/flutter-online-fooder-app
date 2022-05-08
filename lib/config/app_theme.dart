import 'package:customer_app/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
class AppTheme {
  AppTheme(this.context);

  BuildContext context;

  ThemeData initTheme() {
    return ThemeData(
      primarySwatch: Colors.yellow,
      primaryColor: Config.colors.kPrimary,
      // ignore: deprecated_member_use
      buttonColor: Config.colors.kPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 56.h),
          ),
          foregroundColor: MaterialStateProperty.all(
            Config.colors.kTextBlack,
          ),
          backgroundColor: MaterialStateProperty.all(
            Config.colors.kPrimary,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Config.colors.kTextBlack,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Config.colors.kTextBlack,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(0, 56.h),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Config.colors.kTextBlack,
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.ptSansTextTheme(
        const TextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 32.sp,
            color: Config.colors.kTextBlack,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 32.sp,
            color: Config.colors.kTextBlack,
          ),
          headline3: TextStyle(
            fontSize: 24.sp,
            color: Config.colors.kTextBlack,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 24.sp,
            color: Config.colors.kTextBlack,
          ),
          headline5: TextStyle(
            fontSize: 20.sp,
            color:Config.colors.kTextBlack,
          ),
          headline6: TextStyle(
            fontSize: 16.sp,
            color: Config.colors.kTextBlack,
          ),
          bodyText1: TextStyle(
            fontSize: 12.sp,
            color: Config.colors.kTextBlack,
          ),
          bodyText2: TextStyle(
            fontSize: 14.sp,
            color: Config.colors.kTextBlack,
          ),
        ),
      ),
    );
  }
}
