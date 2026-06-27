import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import 'app_image.dart';

class ProductGallery extends StatelessWidget {
  final String imagePath;
  final int currentImage;
  final ValueChanged<int> onChanged;

  const ProductGallery({
    super.key,
    required this.imagePath,
    required this.currentImage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.fieldBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: PageView.builder(
            itemCount: 3,
            onPageChanged: onChanged,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(24.w),
              child: AppImage(
                path: imagePath,
                height: 220.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                width: index == currentImage ? 20.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: index == currentImage
                      ? AppColors.primary
                      : AppColors.dotInactive,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12.h,
          left: 16.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 22.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Positioned(
          top: 12.h,
          right: 16.w,
          child: Icon(
            Icons.ios_share,
            size: 22.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
