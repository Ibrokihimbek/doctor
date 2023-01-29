import 'package:flutter/material.dart';

class MyColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Primary
  static const Color primary = Color(0xff0000ff);

  // Secondary
  static const Color secondary = Color(0xFFFFB800);

  // Tertiary
  static const Color tertiary1 = Color(0xFF6D5FFD);
  static const Color tertiary2 = Color(0xFFFF1843);

  // Neutral
  static const Color neutralBlack = Color(0xFF09101D);
  static const Color neutral1 = Color(0xFF2C3A4B);
  static const Color neutral2 = Color(0xFF394452);
  static const Color neutral3 = Color(0xFF545D69);
  static const Color neutral4 = Color(0xFF6D7580);
  static const Color neutral5 = Color(0xFF858C94);
  static const Color neutral6 = Color(0xFFA5ABB3);
  static const Color neutral7 = Color(0xFFDADEE3);
  static const Color neutral8 = Color(0xFFEBEEF2);
  static const Color neutral9 = Color(0xFFF4F6F9);
  static const Color neutralWhite = Color(0xFFFFFFFF);

  // Accent
  static const Color accent1 = Color(0xFFECB2F2);
  static const Color accent2 = Color(0xFF2D6A6A);
  static const Color accent3 = Color(0xFFE9AD8C);
  static const Color accent4 = Color(0xFF221874);
  static const Color accent5 = Color(0xFF221874);
  static const Color accent6 = Color(0xFFE1604D);

  // Action Primary
  static const Color actionPrimaryDefault = Color(0xFF2972FE);
  static Color actionPrimaryHover =
      Color.alphaBlend(Color(0xFF2972FE), Color(0xFFFFFFFF).withOpacity(0.2));
  static Color actionPrimaryActive =
      Color.alphaBlend(Color(0xFF2972FE), Color(0xFF000000).withOpacity(0.2));
  static const Color actionPrimaryDisabled = Color(0xFF93B8FE);
  static const Color actionPrimaryInverted = Color(0xFFFFFFFF);

  // Action Secondary
  static const Color actionSecondaryDefault = Color(0xFFFFB800);
  static Color actionSecondaryHover =
      Color.alphaBlend(Color(0xFFFFB800), Color(0xFFFFFFFF).withOpacity(0.2));
  static Color actionSecondaryActive =
      Color.alphaBlend(Color(0xFFFFB800), Color(0xFF000000).withOpacity(0.2));
  static const Color actionSecondaryDisabled = Color(0xFFFFB800);
  static const Color actionSecondaryInverted = Color(0xFFFFFFFF);

  // Action Neutral
  static const Color actionNeutralDefault = Color(0xFF9098A1);
  static Color actionNeutralHover =
      Color.alphaBlend(Color(0xFF9098A1), Color(0xFFFFFFFF).withOpacity(0.2));
  static Color actionNeutralActive =
      Color.alphaBlend(Color(0xFF9098A1), Color(0xFF000000).withOpacity(0.2));
  static const Color actionNeutralDisabled = Color(0xFF9098A1);
  static const Color actionNeutralInverted = Color(0xFFFFFFFF);

  // States
  static const Color success = Color(0xFF23A757);
  static const Color successBg = Color(0xFFEDF9F0);
  static const Color warning = Color(0xFFB95000);
  static const Color warningBg = Color(0xFFFFF4EC);
  static const Color error = Color(0xFFDA1414);
  static const Color errorBg = Color(0xFFFEEFEF);
  static const Color statusinfo = Color(0xFF2E5AAC);
  static const Color infoBg = Color(0xFFEEF2FA);

  // Others
  static const otherGradient1 = [ Color(0xFF6499FF),Color(0xFF2972FE),];
  static const otherGradient2 = [Color(0xFFFFB800), Color(0xFFFFDA7B)];
  static List<Color> otherGradient3 = [
    Color(0xFFFF1843).withOpacity(0.9),
    Color(0xFFFF5E7C).withOpacity(0.9)
  ];
  static const Color othersDark1 = Color(0xFF161B20);
  static const Color othersDark2 = Color(0xFF0D0D0D);
  static const Color othersDark3 = Color(0xFF141414);
  static const Color othersDark4 = Color(0xFF252525);

  //Specialist Gradient
  static const specialistGradient1 = [Color(0xFFFF5E7C), Color(0xFFFF1843)];
  static const specialistGradient2 = [Color(0xFF2972FE), Color(0xFF6499FF)];
  static const specialistGradient3 = [Color(0xFFFFB800), Color(0xFFFFDA7B)];

  // Smoother
  static const Color smoother1 = Color(0xFFFFFBFB);
  static const Color smoother2 = Color(0xFFF6F9FF);
  static const Color smoother3 = Color(0xFFF6F8FB);
  static const Color smoother4 = Color(0xFFEAFFF3);
}
