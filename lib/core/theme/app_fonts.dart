import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextStyles {
  static final String _fontFamily = 'Stolzl';
  static final double _textHeight = 1.4;

  static TextStyle titleh4 = TextStyle(
    color: ColorStyles.gray800,
    fontWeight: FontWeight.w500,
    height: _textHeight,
    fontFamily: _fontFamily,
    fontSize: 16.sp,
  );

  static TextStyle labelXS = TextStyle(
    color: ColorStyles.gray800,
    fontWeight: FontWeight.w400,
    height: _textHeight,
    fontFamily: _fontFamily,
    fontSize: 10.sp,
  );

  static TextStyle labelS = TextStyle(
    color: ColorStyles.crimson400,
    fontWeight: FontWeight.w400,
    height: _textHeight,
    fontFamily: _fontFamily,
    fontSize: 12.sp,
  );
}
