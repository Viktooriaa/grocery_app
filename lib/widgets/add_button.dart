import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onPressed,
        child: SizedBox(
          width: 48.w,
          height: 48.h,
          child: Icon(
            Icons.add,
            color: AppColors.background,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
