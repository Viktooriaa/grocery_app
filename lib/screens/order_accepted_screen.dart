import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_colors.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [

          /// TOP GRADIENT
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260.h,
            child: Image.asset(
              'assets/images/gradient.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const SizedBox(),
            ),
          ),

          /// BOTTOM GRADIENT
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 180.h,
            child: Image.asset(
              'assets/images/gradient_bottom.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const SizedBox(),
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [

                  /// TOP SPACE
                  SizedBox(height: size.height * 0.11),

                  /// IMAGE
                  Image.asset(
                    'assets/images/order_accepted.png',
                    width: 250.w,
                    fit: BoxFit.contain,
                    errorBuilder: (c, e, s) => Icon(
                      Icons.check_circle,
                      size: 130.sp,
                      color: AppColors.primary,
                    ),
                  ),

                  SizedBox(height: 50.h),

                  /// TITLE
                  Text(
                    'Your Order has been\naccepted',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 18.h),

                  /// SUBTITLE
                  Text(
                    "Your items has been placed and is on\nit's way to being processed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const Spacer(),

                  /// BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 62.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.r),
                        ),
                      ),
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 22.h),

                  /// BACK TO HOME
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    child: Text(
                      'Back to home',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
