import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/select_location_screen.dart';

import '../core/theme/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// авто-фокус (відкриває клавіатуру)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    final double bottomOffset = keyboard > 0 ? keyboard + 24.h : 32.h;

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
                    "Enter your 4-digit code",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// LABEL
                  Text(
                    "Code",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF828282),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  /// INPUT
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode, // ключ
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 18.sp,
                      letterSpacing: 12.sp,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: "- - - -",
                      hintStyle: TextStyle(
                        letterSpacing: 12.sp,
                        color: const Color(0xFFBDBDBD),
                      ),
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),

                  const Divider(
                    thickness: 1,
                    color: AppColors.border,
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),

          /// RESEND CODE
          Positioned(
            left: 24.w,
            bottom: bottomOffset + 20.h,
            child: Text(
              "Resend Code",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
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
                    builder: (context) => const LocationScreen(),
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
