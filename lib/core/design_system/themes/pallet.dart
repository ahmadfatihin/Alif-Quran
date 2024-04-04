import 'package:flutter/material.dart';

class Pallet {
  ///#63784E
  /// darkGreen is a dark shade of green.
  static const Color darkGreen = Color(0xff63784E);

  ///#A1AD90
  /// green is a medium shade of green.
  static const Color green = Color(0xffA1AD90);

  ///#ADC499
  /// lightGreen is a very light shade of green.
  static const Color lightGreen = Color(0xffADC499);

  ///#009E89
  static const Color cyan = Color(0xff009E89);

  ///#8C5C2E
  /// darkBrown is a rich, warm brown color that resembles a dark chocolate hue.
  static const Color darkBrown = Color(0xff8C5C2E);

  ///#CBA274
  /// brown is a light to medium shade of brown that has a slightly yellowish tint.
  static const Color brown = Color(0xffCBA274);

  ///#FFEDD4
  /// brown10 is a very light shade of brown, almost a creamy beige color.
  static const Color brown10 = Color(0xffFFEDD4);

  ///#DAA520
  /// gold is a warm yellow-gold color that resembles the color of gold metal.
  static const Color gold = Color(0xffDAA520);

  ///#AF9F8C
  /// mono is a light to medium shade of brown that has a slightly greyish tint.
  static const Color mono = Color(0xffAF9F8C);

  ///#A2A2A2
  /// grey is a neutral, medium shade of grey.
  static const Color grey = Color(0xffA2A2A2);

  ///#F2F2F2
  /// grey10 is a very light shade of grey, almost white.
  static const Color grey10 = Color(0xffF2F2F2);

  ///#555555
  /// grey20 is a dark shade of grey, almost a neutral black.
  static const Color grey20 = Color(0xff555555);

  ///#888888
  /// grey30 is a medium-light shade of grey.
  static const Color grey30 = Color(0xff888888);

  ///#999999
  /// grey40 is a medium shade of grey.
  static const Color grey40 = Color(0xff999999);

  ///#D9D9D9
  /// grey50 is a light shade of grey.
  static const Color grey50 = Color(0xffD9D9D9);

  ///#000000
  /// black is a neutral black color.
  static const Color black = Color(0xff000000);

  ///#FFFFFF
  /// white is a neutral white color.
  static const Color white = Color(0xffFFFFFF);

  ///#C4AEAD
  /// greyRed is a light greyish-red color.
  static const Color greyRed = Color(0xffC4AEAD);

  ///#CD7F32
  /// orangeBrown is a medium shade of orange-brown.
  static const Color orangeBrown = Color(0xffCD7F32);

  ///#623820
  /// darkerBrown is a dark shade of brown.
  static const Color darkerBrown = Color(0xff623820);

  ///#2E4B8C
  /// blue is a dark shade of blue.
  static const Color blue = Color(0xff2E4B8C);

  static const Color blue10 = Color(0xff1877F2);

  ///#0088C1
  /// blueLight is a light shade of blue.
  static const Color blueLight = Color(0xff0088C1);

  ///#00C3D3
  /// sky is a light shade of blue, reminiscent of the sky.
  static const Color sky = Color(0xff00C3D3);
  static const Color sky10 = Color(0xffC3FCF1);

  ///#682E8C
  /// purple is a dark shade of purple.
  static const Color purple = Color(0xff682E8C);

  ///#8D5C2E
  /// brown30 is a medium-light shade of brown.
  static const Color brown30 = Color(0xff8D5C2E);

  ///#704A26
  /// brown40 is a medium shade of brown.
  static const Color brown40 = Color(0xff704A26);

  static List<Color> sakura = [
    const Color(0xFFFBE3DD),
    const Color(0xFFF9DADE),
  ];

  static LinearGradient sakuraGradient = LinearGradient(
    colors: sakura,
  );

  //Backgrounds

  static Color get primaryBg => const Color(0xFFC0F9FF);

  static Color get successBg => const Color(0xFFAAF0C4);

  static Color get errorBg => const Color(0xFFEABABA);

  static Color get processBg => const Color(0xFFFFDEB7);

  static Color get secondBg => const Color(0xFFC8DAFF);

  static Color get lightBg => const Color(0xFFFFFFFF);

  static Color get disableBg => const Color(0xFFF7F7F7);

  static Color get selectedBg => const Color(0xFFDEE0FC);

  static Color get newPrimaryBg => const Color(0xFF47B8C5);

  //Text&Others

  static Color get textDark => const Color(0xFF3C3C3C);

  static Color get textGrey => const Color(0xFF909090);

  static Color get textLight => const Color(0xFFFFFFFF);

  static Color get border => const Color(0xFFE3E3E3);

  static Color get darkBorder => const Color(0xFFD2D2D2);

  static Color get whiteScaffold => const Color(0xFFF7F7FC);

  //Disable

  static Color get disablePrimary => const Color(0xFFCED1FA);

  static Color get disableSecondary => const Color(0xFF84CAFF);

  static LinearGradient get disableGradient => const LinearGradient(
        stops: [0.0374, 0.967],
        transform: GradientRotation(107.13 * 3.1415927 / 180),
        colors: [Color(0xFFA3DCE2), Color(0xFFB6F1F8)],
      );

  static Color get disableError => const Color(0xFFCD9393);

  static Color get disableSuccess => const Color(0xFF8ECBC1);

  static Color get disableProcess => const Color(0xFFDBBB94);
}
