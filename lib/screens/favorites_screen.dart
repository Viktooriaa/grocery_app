import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class FavoritesScreen extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;

  const FavoritesScreen({
    super.key,
    required this.onAddToCart,
  });

  final List<Map<String, dynamic>> items = const [
    {
      'name': 'Sprite Can',
      'desc': '325ml, Price',
      'price': 1.50,
      'image': 'assets/images/sprite_can.png',
      'isAvailable': false,
    },
    {
      'name': 'Diet Coke',
      'desc': '355ml, Price',
      'price': 1.99,
      'image': 'assets/images/diet_cola.png',
      'isAvailable': true,
    },
    {
      'name': 'Apple & Grape Juice',
      'desc': '2L, Price',
      'price': 15.50,
      'image': 'assets/images/juice_apple_and_grape.png',
      'isAvailable': true,
    },
    {
      'name': 'Coca Cola Can',
      'desc': '325ml, Price',
      'price': 4.99,
      'image': 'assets/images/coca_cola_can.png',
      'isAvailable': true,
    },
    {
      'name': 'Pepsi Can',
      'desc': '330ml, Price',
      'price': 4.99,
      'image': 'assets/images/pepsi_can.png',
      'isAvailable': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [

              /// HEADER
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  'Favourite',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              Divider(height: 1.h),

              /// LIST
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, _) => Divider(
                    height: 1.h,
                    indent: 96.w,
                  ),
                  itemBuilder: (context, i) => _item(items[i]),
                ),
              ),

              /// BUTTON
              Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 58.h,
                  child: ElevatedButton(
                    onPressed: () {

                      final unavailable = items.any(
                            (item) => item['isAvailable'] == false,
                      );

                      if (unavailable) {
                        _showErrorPopup(context);
                        return;
                      }

                      for (var item in items) {
                        onAddToCart(item);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'Add All To Cart',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ERROR POPUP
  void _showErrorPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 20.h),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// CLOSE
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ),

                SizedBox(height: 16.h),

                /// IMAGE
                Image.asset(
                  'assets/images/error_page.png',
                  width: 180.w,
                ),

                SizedBox(height: 28.h),

                /// TITLE
                Text(
                  'Oops! Order Failed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 14.h),

                /// SUBTITLE
                Text(
                  'Something went terribly wrong.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 32.h),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 58.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                    ),
                    child: Text(
                      'Please Try Again',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 18.h),

                /// BACK
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// ITEM
  Widget _item(Map<String, dynamic> item) {
    return SizedBox(
      height: 88.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// IMAGE
            SizedBox(
              width: 64.w,
              height: 64.h,
              child: Image.asset(
                item['image'],
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 16.w),

            /// TEXT
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  /// DESC
                  Text(
                    item['desc'],
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  /// OUT OF STOCK
                  if (item['isAvailable'] == false)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        'Out of stock',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// PRICE
            Row(
              children: [
                Text(
                  "\$${item['price'].toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(
                  Icons.chevron_right,
                  size: 22.sp,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
