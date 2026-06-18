import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_colors.dart';
import 'verification_screen.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300.h,
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
            height: 300.h,
            child: Image.asset(
              "assets/images/gradient_bottom.png",
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// BACK
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                  /// TITLE
                  Text(
                    "Enter your mobile number",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  /// LABEL
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF828282),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  /// INPUT
                  Row(
                    children: [
                      Container(
                        width: 26.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: const Color(0xFF006A4E),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            radius: 5.r,
                            backgroundColor: const Color(0xFFF42A41),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "+880",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1, color: AppColors.border),

                  const Spacer(),
                ],
              ),
            ),
          ),

          /// FLOAT BUTTON
          Positioned(
            right: 24.w,
            bottom: keyboard > 0 ? keyboard + 24.h : 32.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerificationScreen(),
                  ),
                );
              },
              child: Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.background,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
