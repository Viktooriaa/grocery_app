import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_sizes.dart';
import '../core/models/app_models.dart';
import '../core/theme/app_colors.dart';
import 'app_image.dart';

class GroceryCategoryCard extends StatelessWidget {
  final GroceryCategory category;
  final VoidCallback? onTap;
  final bool compact;

  const GroceryCategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: compact ? 180.w : null,
      margin: compact ? EdgeInsets.only(right: 12.w) : null,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: compact ? _compactLayout() : _gridLayout(),
    );

    if (onTap == null) return card;
    return GestureDetector(onTap: onTap, child: card);
  }

  Widget _compactLayout() {
    return Row(
      children: [
        SizedBox(width: 12.w),
        AppImage(path: category.imagePath, height: 70.h, width: 70.w),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            category.name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _gridLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(path: category.imagePath, height: 100.h),
        SizedBox(height: 10.h),
        Text(
          category.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
