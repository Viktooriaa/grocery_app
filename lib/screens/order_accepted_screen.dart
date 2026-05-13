import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [

          /// TOP GRADIENT
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260,
            child: Image.asset(
              'assets/images/gradient.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const SizedBox(),
            ),
          ),

          /// BOTTOM GRADIENT
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 180,
            child: Image.asset(
              'assets/images/gradient_bottom.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const SizedBox(),
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [

                  /// TOP SPACE
                  SizedBox(height: size.height * 0.11),

                  /// IMAGE
                  Image.asset(
                    'assets/images/order_accepted.png',
                    width: 250,
                    fit: BoxFit.contain,
                    errorBuilder: (c, e, s) => const Icon(
                      Icons.check_circle,
                      size: 130,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 50),

                  /// TITLE
                  const Text(
                    'Your Order has been\naccepted',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// SUBTITLE
                  const Text(
                    "Your items has been placed and is on\nit's way to being processed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const Spacer(),

                  /// BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: const Text(
                        'Track Order',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  /// BACK TO HOME
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    child: const Text(
                      'Back to home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}