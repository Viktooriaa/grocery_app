import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP IMAGE
              SizedBox(
                height: 374,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/sign_in.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              const SizedBox(height: 32),

              /// TITLE
              const Text(
                "Get your groceries\nwith nectar",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 30),

              /// PHONE FIELD
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NumberScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/flag.png",
                        width: 32,
                        height: 26,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "+880",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// OR TEXT
              const Center(
                child: Text(
                  "Or connect with social media",
                  style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                ),
              ),

              const SizedBox(height: 24),

              /// GOOGLE BUTTON
              PrimaryButton(
                title: "Continue with Google",
                icon: "assets/icons/google.svg",
                color: const Color(0xFF5383EC),
                onPressed: () {},
              ),

              const SizedBox(height: 16),

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
