import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_colors.dart';
import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  final TextEditingController _usernameController = TextEditingController(
    text: 'Afsar Hossen Shuvo',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'imshuvo97@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '12345678',
  );

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration({Widget? suffix}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.transparent,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
      suffixIcon: suffix,
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
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
                AppAssets.gradient,
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
                AppAssets.gradientBottom,
                fit: BoxFit.cover,
              ),
            ),

            //  КОНТЕНТ
            SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  color: AppColors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.authHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),

                        // Логотип
                        Center(
                          child: SvgPicture.asset(
                            AppAssets.carrotOrange,
                            height: 60.h,
                          ),
                        ),

                        SizedBox(height: 48.h),

                        Text(
                          AppStrings.signUpTitle,
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        Text(
                          AppStrings.signUpSubtitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Username
                        Text(
                          AppStrings.username,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          controller: _usernameController,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: _fieldDecoration(),
                        ),

                        SizedBox(height: 24.h),

                        // Email
                        Text(
                          AppStrings.email,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: _fieldDecoration(
                            suffix: Icon(
                              Icons.check,
                              color: AppColors.primary,
                              size: 20.sp,
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // Password
                        Text(
                          AppStrings.password,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: _fieldDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              child: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.textSecondary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Terms
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textSecondary,
                              height: 1.5,
                            ),
                            children: const [
                              TextSpan(
                                text: AppStrings.termsOfServicePrefix,
                              ),
                              TextSpan(
                                text: AppStrings.termsOfService,
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: AppStrings.privacyMiddle),
                              TextSpan(
                                text: AppStrings.privacyPolicy,
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),

                        SizedBox(height: 28.h),

                        //  Кнопка
                        SizedBox(
                          width: double.infinity,
                          height: 58.h,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                                (route) => false,
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
                              AppStrings.signUpButton,
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

                        // Already have an account?
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.alreadyHaveAccount,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  AppStrings.logIn,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
