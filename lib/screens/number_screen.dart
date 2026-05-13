import 'package:flutter/material.dart';
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
                    "Enter your mobile number",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// LABEL
                  const Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF828282),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// INPUT
                  Row(
                    children: [
                      Container(
                        width: 26,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xFF006A4E),
                        ),
                        child: const Center(
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFF42A41),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "+880",
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 16,
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
            right: 24,
            bottom: keyboard > 0 ? keyboard + 24 : 32,
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
