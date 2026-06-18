import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  InputDecoration _fieldDecoration({Widget? suffix}) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
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

            //  КОНТЕНТ
            SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),

                        // Логотип
                        Center(
                          child: SvgPicture.asset(
                            "assets/icons/carrot_orange.svg",
                            height: 60.h,
                          ),
                        ),

                        SizedBox(height: 48.h),

                        // Заголовок
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        // Підзаголовок
                        Text(
                          "Enter your credentials to continue",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Username
                        Text(
                          "Username",
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
                          "Email",
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
                          "Password",
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
                              TextSpan(text: "By continuing you agree to our "),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: "\nand "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: "."),
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
                              "Sing Up",
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
                                "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  "Log in",
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
