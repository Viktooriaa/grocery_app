import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  static double get pageHorizontal => 16.w;
  static double get authHorizontal => 24.w;
  static double get cardRadius => 16.r;
  static double get buttonRadius => 18.r;
  static double get iconButton => 36.w;
  static double get bottomButtonHeight => 58.h;
  static double get searchHeight => 48.h;

  static int productGridColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 900) return 4;
    if (width >= 650) return 3;
    return 2;
  }

  static double productAspectRatio(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 650 ? 0.82 : 0.75;
  }
}
