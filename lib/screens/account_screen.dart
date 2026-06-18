import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),

                // Профіль
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        backgroundImage: const AssetImage(
                          'assets/images/account_man.png',
                        ),
                        onBackgroundImageError: (_, _) {},
                        backgroundColor: AppColors.border,
                      ),

                      SizedBox(width: 16.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Afsar Hossen',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.edit_outlined,
                                  size: 16.sp,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Imshuvo97@gmail.com',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Divider(color: AppColors.border, height: 1.h),

                // Меню
                _menuItem('assets/icons/orders.svg', 'Orders'),
                _menuItem('assets/icons/my_details.svg', 'My Details'),
                _menuItem('assets/icons/delicery_address.svg', 'Delivery Address'),
                _menuItem('assets/icons/payment_methods.svg', 'Payment Methods'),
                _menuItem('assets/icons/promo_code.svg', 'Promo Cord'),
                _menuItem('assets/icons/Bell.svg', 'Notifecations'),
                _menuItem('assets/icons/help.svg', 'Help'),
                _menuItem('assets/icons/about.svg', 'About'),

                SizedBox(height: 24.h),

                // Log Out
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                            (route) => false,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F2),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 22.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String iconPath, String label) {
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
                iconPath,
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
                  label,
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
