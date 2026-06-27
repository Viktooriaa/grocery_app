import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/app_colors.dart';

class CheckoutRow extends StatelessWidget {
  final String title;
  final String value;

  const CheckoutRow(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              Icon(Icons.chevron_right, size: 18.sp),
            ],
          ),
        ),
        Divider(height: 1.h),
      ],
    );
  }
}

class CheckoutIconRow extends StatelessWidget {
  final String title;
  final String iconPath;

  const CheckoutIconRow(this.title, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 6.w),
              Icon(Icons.chevron_right, size: 18.sp),
            ],
          ),
        ),
        Divider(height: 1.h),
      ],
    );
  }
}
