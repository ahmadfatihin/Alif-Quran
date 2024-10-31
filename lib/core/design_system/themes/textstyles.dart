import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:alif_quran/core/design_system/themes/dimension.dart';
import 'package:alif_quran/core/design_system/themes/pallet.dart';

class TextStyles {
  // default
  static TextStyle get defaultStyle => GoogleFonts.poppins(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: Pallet.textDark,
      );

  /// Font Size 10 Default
  static TextStyle get text2XsDefault => defaultStyle.copyWith(
        fontSize: Dimension.style10,
      );

  /// Font Size 10 Weight 400
  static TextStyle get text2XsRegular => text2XsDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 10 Weight 600
  static TextStyle get text2XsSemiBold => text2XsDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 10 Weight 800
  static TextStyle get text2XsXtraBold => text2XsDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 12 Default
  static TextStyle get textXsDefault => defaultStyle.copyWith(
        fontSize: Dimension.style12,
      );

  /// Font Size 12 Weight 400
  static TextStyle get textXsRegular => textXsDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 12 Weight 600
  static TextStyle get textXsSemiBold => textXsDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 12 Weight 800
  static TextStyle get textXsXtraBold => textXsDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 14 Default
  static TextStyle get textSmDefault => defaultStyle.copyWith(
        fontSize: Dimension.style14,
      );

  /// Font Size 14 Weight 400
  static TextStyle get textSmRegular => textSmDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 14 Weight 600
  static TextStyle get textSmSemiBold => textSmDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 14 Weight 800
  static TextStyle get textSmXtraBold => textSmDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 16 Default
  static TextStyle get textBaseDefault => defaultStyle.copyWith(
        fontSize: Dimension.style16,
      );

  /// Font Size 16 Weight 400
  static TextStyle get textBaseRegular => textBaseDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 16 Weight 600
  static TextStyle get textBaseSemiBold => textBaseDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 16 Weight 700
  static TextStyle get textBaseBold => textBaseDefault.copyWith(
        fontWeight: FontWeight.w700,
      );

  /// Font Size 16 Weight 800
  static TextStyle get textBaseXtraBold => textBaseDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 18 Default
  static TextStyle get textMdDefault => defaultStyle.copyWith(
        fontSize: Dimension.style18,
      );

  /// Font Size 18 Weight 400
  static TextStyle get textMdRegular => textMdDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 18 Weight 600
  static TextStyle get textMdSemiBold => textMdDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 18 Weight 800
  static TextStyle get textMdXtraBold => textMdDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  // textLG
  /// Font Size 20 Default
  static TextStyle get textLgDefault => defaultStyle.copyWith(
        fontSize: Dimension.style20,
      );

  /// Font Size 20 Weight 400
  static TextStyle get textLgRegular => textLgDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 20 Weight 600
  static TextStyle get textLgSemiBold => textLgDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 20 Weight 800
  static TextStyle get textLgXtraBold => textLgDefault.copyWith(
        fontWeight: FontWeight.w800,
      );
  // textXL
  /// Font Size 24 Default
  static TextStyle get textXlDefault => defaultStyle.copyWith(
        fontSize: Dimension.style24,
      );

  /// Font Size 24 Weight 400
  static TextStyle get textXlRegular => textXlDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 24 Weight 600
  static TextStyle get textXlSemiBold => textXlDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 24 Weight 800
  static TextStyle get textXlXtraBold => textXlDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  // text2XL
  /// Font Size 32 Default
  static TextStyle get text2XlDefault => defaultStyle.copyWith(
        fontSize: Dimension.style32,
      );

  /// Font Size 32 Weight 400
  static TextStyle get text2XlRegular => text2XlDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 32 Weight 600
  static TextStyle get text2XlSemiBold => text2XlDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 32 Weight 800
  static TextStyle get text2XlXtraBold => text2XlDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 40 Default
  static TextStyle get text3XlDefault => defaultStyle.copyWith(
        fontSize: Dimension.style40,
      );

  /// Font Size 40 Weight 400
  static TextStyle get text3XlRegular => text3XlDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 40 Weight 600
  static TextStyle get text3XlSemiBold => text3XlDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 40 Weight 800
  static TextStyle get text3XlXtraBold => text3XlDefault.copyWith(
        fontWeight: FontWeight.w800,
      );

  /// Font Size 50 Default
  static TextStyle get text4XlDefault => defaultStyle.copyWith(
        fontSize: Dimension.style50,
      );

  /// Font Size 50 Weight 400
  static TextStyle get text4XlRegular => text3XlDefault.copyWith(
        fontWeight: FontWeight.w400,
      );

  /// Font Size 50 Weight 600
  static TextStyle get text4XlSemiBold => text3XlDefault.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Font Size 50 Weight 800
  static TextStyle get text4XlXtraBold => text3XlDefault.copyWith(
        fontWeight: FontWeight.w800,
      );
}
