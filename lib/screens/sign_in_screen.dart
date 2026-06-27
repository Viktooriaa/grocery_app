import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'number_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.authHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 374.h,
                width: double.infinity,
                child: Image.asset(
                  AppAssets.signIn,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              SizedBox(height: 32.h),

              Text(
                AppStrings.signInTitle,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 30.h),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NumberScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.flag,
                        width: 32.w,
                        height: 26.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        AppStrings.phonePrefix,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              Center(
                child: Text(
                  AppStrings.socialConnect,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              PrimaryButton(
                title: AppStrings.continueWithGoogle,
                icon: AppAssets.googleIcon,
                color: AppColors.google,
                onPressed: () {},
              ),

              SizedBox(height: 16.h),

              PrimaryButton(
                title: AppStrings.continueWithFacebook,
                icon: AppAssets.facebookIcon,
                color: AppColors.facebook,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
