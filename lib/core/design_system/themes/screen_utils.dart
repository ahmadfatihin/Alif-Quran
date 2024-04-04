import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void setupScreenUtil(BuildContext context) {
  double baseWidth = MediaQuery.of(context).size.width;
  double baseHeight = MediaQuery.of(context).size.height;
  double defaultScreenUtilWidth = 1080;
  double defaultScreenUtilHeight = 1920;
  double iPadPro12InchWidth = 2048;
  double iPadPro12InchHeight = 2732;
  double designWidth = 0;
  double designHeight = 0;

  /// ipad 11-inch width: 834, height: 1194
  /// ipad 9-inch width: 768, height: 1024
  if (baseWidth >= 768) {
    designWidth = iPadPro12InchWidth;
  } else {
    designWidth = defaultScreenUtilWidth;
  }

  if (baseHeight >= 1024) {
    designHeight = iPadPro12InchHeight;
  } else {
    designHeight = defaultScreenUtilHeight;
  }

  ScreenUtil.init(
    context,
    designSize: Size(designWidth, designHeight),
  );
}

bool isLargePhone(BuildContext context) =>
    MediaQuery.of(context).size.width > 600 ? true : false;
bool isNormalPhone(BuildContext context) =>
    MediaQuery.of(context).size.width > 400 &&
            MediaQuery.of(context).size.width < 600
        ? true
        : false;
bool isSmallPhone(BuildContext context) =>
    MediaQuery.of(context).size.width < 400 ? true : false;
bool isSmallPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height < 700 ? true : false;
bool isReallySmallPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height < 600 ? true : false;
bool isBigPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height > 1200 ? true : false;

/// Setting height and width
double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);
