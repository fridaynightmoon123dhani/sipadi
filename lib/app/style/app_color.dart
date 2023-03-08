import 'package:flutter/cupertino.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF0F50C6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = Color(0xFF266EF1);
  static Color primarySoft = Color(0xFF548DF3);
  static Color primaryGreen = Color(0xFF00cc00);
  static Color primaryGreenSoft = Color(0xFF333399);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xFF1B1F24);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);

  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);

  static Color kLightYellow = Color(0xFFFFF9EC);
  static Color kLightYellow2 = Color(0xFFFFE4C7);
  static Color kDarkYellow = Color(0xFFEA8B21);
  static Color kPalePink = Color(0xFFFED4D6);

  static Color kRed = Color(0xFFE46472);
  static Color kLavender = Color(0xFFD5E4FE);
  static Color kBlue = Color(0xFF6488E4);
  static Color kGray = Color(0xFF9EA0A9);
  static Color kLightGreen = Color(0xFFD9E6DC);
  static Color kGreen = Color(0xFF309397);

  static Color kDarkBlue = Color(0xFF0D253F);
}
