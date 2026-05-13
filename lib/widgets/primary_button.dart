import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final String? icon;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color =  AppColors.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if (icon != null)
              SvgPicture.asset(
                icon!,
                width: 18,
                height: 18,
              ),

              const SizedBox(width: 25),

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