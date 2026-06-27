import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_sizes.dart';
import '../core/models/app_models.dart';
import '../core/providers/cart_provider.dart';
import '../core/theme/app_colors.dart';
import 'app_image.dart';
import 'quantity_button.dart';

class CartRow extends ConsumerWidget {
  final CartItem item;

  const CartRow({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.fieldBackground,
              borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            ),
            child: AppImage(path: item.product.imagePath, height: 50.h),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.product.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cart.remove(item.product.id),
                      child: Icon(Icons.close, size: 18.sp),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  item.product.description,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    QuantityButton(
                      icon: Icons.remove,
                      onTap: () => cart.decrement(item.product.id),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    QuantityButton(
                      icon: Icons.add,
                      isPrimary: true,
                      onTap: () => cart.increment(item.product.id),
                    ),
                    const Spacer(),
                    Text(
                      '\$${item.product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
