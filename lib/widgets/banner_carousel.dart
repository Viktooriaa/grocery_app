import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/theme/app_colors.dart';

class BannerCarousel extends StatelessWidget {
  final int currentBanner;
  final ValueChanged<int> onChanged;

  const BannerCarousel({
    super.key,
    required this.currentBanner,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pageHorizontal),
          child: SizedBox(
            height: 120.h,
            child: PageView.builder(
              itemCount: 3,
              onPageChanged: onChanged,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                child: Container(
                  width: double.infinity,
                  color: AppColors.primary,
                  child: Image.asset(
                    AppAssets.banner,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              width: index == currentBanner ? 20.w : 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: index == currentBanner
                    ? AppColors.primary
                    : AppColors.dotInactive,
                borderRadius: BorderRadius.circular(3.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
