import 'package:flutter/material.dart';
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
    final double bottomOffset = keyboard > 0 ? keyboard + 24.0 : 32.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
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
            height: 300,
            child: Image.asset(
              "assets/images/gradient_bottom.png",
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// BACK
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  /// TITLE
                  const Text(
                    "Enter your 4-digit code",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// LABEL
                  const Text(
                    "Code",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF828282),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// INPUT
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode, // ключ
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    autofocus: true,
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 12,
                      color: AppColors.textPrimary,
                    ),
                    decoration: const InputDecoration(
                      hintText: "- - - -",
                      hintStyle: TextStyle(
                        letterSpacing: 12,
                        color: Color(0xFFBDBDBD),
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
            left: 24,
            bottom: bottomOffset + 20,
            child: const Text(
              "Resend Code",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// FLOAT BUTTON
          Positioned(
            right: 24,
            bottom: keyboard > 0 ? keyboard + 24 : 32,
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
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color:  AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.background,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}