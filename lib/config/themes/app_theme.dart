import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColros.lightWhiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColros.lightWhiteColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColros.lightDeepOrange,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColros.lightDeepOrange,
        size: 30.0,
      ),
      titleTextStyle: TextStyle(
        color: AppColros.lightBlackColor,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
      ),
      // ignore: deprecated_member_use
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColros.lightBlackColor,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      selectedItemColor: AppColros.lightDeepOrange,
      unselectedItemColor: AppColros.lightGreyColor,
      backgroundColor: AppColros.lightWhiteColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColros.lightDeepOrange),
      overlayColor: MaterialStateProperty.all(AppColros.lightGreyColor),
      trackColor: MaterialStateProperty.all(AppColros.lightGreyOffWhiteColor),
      splashRadius: 25,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColros.lightBlackColor,
      ),
      displaySmall: GoogleFonts.acme(
        color: AppColros.lightDeepOrange,
        fontSize: 16.0,
      ),
    ),
    primaryColor: AppColros.lightDeepOrange,
  );
}

ThemeData darkThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColros.lightWhiteColor,
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: AppColros.lightWhiteColor,
        size: 30.0,
      ),
      titleTextStyle: TextStyle(
        color: AppColros.lightWhiteColor,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
      ),
      // ignore: deprecated_member_use
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColros.lightBlackColor,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 10.0,
      backgroundColor: HexColor('333739'),
      selectedItemColor: AppColros.lightWhiteColor,
      unselectedItemColor: AppColros.lightGreyColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColros.lightDeepOrange),
      overlayColor: MaterialStateProperty.all(AppColros.lightGreyColor),
      trackColor: MaterialStateProperty.all(AppColros.lightGreyOffWhiteColor),
      splashRadius: 25,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColros.lightWhiteColor,
      ),
      displaySmall: GoogleFonts.acme(
        color: AppColros.lightGreyColor,
        fontSize: 16.0,
      ),
    ),
    primaryColor: AppColros.lightGreyColor,
  );
}
