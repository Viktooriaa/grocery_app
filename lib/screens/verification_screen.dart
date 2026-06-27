import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/select_location_screen.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
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
              AppAssets.gradient,
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
              AppAssets.gradientBottom,
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.authHorizontal),
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
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                  /// TITLE
                  Text(
                    AppStrings.enterCode,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// LABEL
                  Text(
                    AppStrings.code,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textSecondary,
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
                      hintText: AppStrings.codeHint,
                      hintStyle: TextStyle(
                        letterSpacing: 12.sp,
                        color: AppColors.muted,
                      ),
                      counterText: '',
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
            left: AppSizes.authHorizontal,
            bottom: bottomOffset + 20.h,
            child: Text(
              AppStrings.resendCode,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// FLOAT BUTTON
          Positioned(
            right: AppSizes.authHorizontal,
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
                      color: AppColors.shadow.withValues(alpha: 0.15),
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
