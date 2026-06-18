import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/login_screen.dart';

import '../core/theme/app_colors.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Білий фон
          Container(color: AppColors.background),

          // Верхній градієнт
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 320.h,
            child: Image.asset(
              "assets/images/gradient.png",
              fit: BoxFit.cover,
            ),
          ),

          // Нижній градієнт
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 220.h,
            child: Image.asset(
              "assets/images/gradient_bottom.png",
              fit: BoxFit.cover,
            ),
          ),

          // КОНТЕНТ
          SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),

                      // Кнопка назад
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22.sp,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      //  Зображення карти
                      Center(
                        child: Image.asset(
                          "assets/images/map.png",
                          height: 150.h,
                        ),
                      ),

                      SizedBox(height: 28.h),

                      // Заголовок
                      Center(
                        child: Text(
                          "Select Your Location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Підзаголовок
                      Center(
                        child: Text(
                          "Switch on your location to stay in tune with\nwhat's happening in your area",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ),

                      // СЕРЕДИНА
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Your Zone
                            Text(
                              "Your Zone",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Banasree",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.textPrimary,
                                ),
                              ],
                            ),
                            Divider(height: 20.h, thickness: 0.8),

                            SizedBox(height: 20.h),

                            // Your Area
                            Text(
                              "Your Area",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Types of your area",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFFBDBDBD),
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFFBDBDBD),
                                ),
                              ],
                            ),
                            Divider(height: 20.h, thickness: 0.8),
                          ],
                        ),
                      ),

                      // Кнопка Submit
                      SizedBox(
                        width: double.infinity,
                        height: 58.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.background,
                              letterSpacing: 0.3.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
