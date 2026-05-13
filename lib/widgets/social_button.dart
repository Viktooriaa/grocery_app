import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final Color color;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.title,
    required this.color,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 20,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}