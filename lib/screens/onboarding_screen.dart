import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/onboarding.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.5)],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/icons/carrot.svg', width: 50.w),

                  SizedBox(height: 20.h),

                  Text(
                    "Welcome\nto our store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                      color: AppColors.background,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    "Ger your groceries in as fast as one hour",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp, color: AppColors.background),
                  ),

                  SizedBox(height: 40.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: PrimaryButton(
                      title: "Get Started",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 75.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
