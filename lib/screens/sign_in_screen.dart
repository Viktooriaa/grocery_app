import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'number_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP IMAGE
              SizedBox(
                height: 374.h,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/sign_in.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              SizedBox(height: 32.h),

              /// TITLE
              Text(
                "Get your groceries\nwith nectar",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 30.h),

              /// PHONE FIELD
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
                        "assets/images/flag.png",
                        width: 32.w,
                        height: 26.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "+880",
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

              /// OR TEXT
              Center(
                child: Text(
                  "Or connect with social media",
                  style: TextStyle(color: const Color(0xFF828282), fontSize: 14.sp),
                ),
              ),

              SizedBox(height: 24.h),

              /// GOOGLE BUTTON
              PrimaryButton(
                title: "Continue with Google",
                icon: "assets/icons/google.svg",
                color: const Color(0xFF5383EC),
                onPressed: () {},
              ),

              SizedBox(height: 16.h),

              /// FACEBOOK BUTTON
              PrimaryButton(
                title: "Continue with Facebook",
                icon: "assets/icons/facebook.svg",
                color: const Color(0xFF4A66AC),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
