import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/models/app_models.dart';
import '../core/theme/app_colors.dart';

class AccountMenuItem extends StatelessWidget {
  final NavItem item;

  const AccountMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                item.iconPath,
                width: 18.w,
                height: 18.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
                placeholderBuilder: (context) => Icon(
                  Icons.circle_outlined,
                  size: 18.sp,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 22.sp,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.border,
          height: 1.h,
          indent: 24.w,
          endIndent: 24.w,
        ),
      ],
    );
  }
}
