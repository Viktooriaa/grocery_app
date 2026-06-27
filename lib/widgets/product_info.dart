import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_colors.dart';

class ProductInfo extends StatelessWidget {
  final bool detailExpanded;
  final VoidCallback onToggleDetail;

  const ProductInfo({
    super.key,
    required this.detailExpanded,
    required this.onToggleDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const Divider(color: AppColors.border),
          GestureDetector(
            onTap: onToggleDetail,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _InfoTitle(AppStrings.productDetail),
                Icon(
                  detailExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
          if (detailExpanded) ...[
            SizedBox(height: 10.h),
            Text(
              AppStrings.productDetailText,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ],
          const Divider(color: AppColors.border),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _InfoTitle(AppStrings.nutritions),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.fieldBackground,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        AppStrings.nutritionWeight,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.border),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _InfoTitle(AppStrings.review),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 18.sp,
                        color: AppColors.rating,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.border),
        ],
      ),
    );
  }
}

class _InfoTitle extends StatelessWidget {
  final String title;

  const _InfoTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}
