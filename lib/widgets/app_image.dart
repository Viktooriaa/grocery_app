import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double height;
  final double? width;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.path,
    required this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: height,
        width: width,
        child: Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.border,
          size: 40.sp,
        ),
      ),
    );
  }
}
