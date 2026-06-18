import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/order_accepted_screen.dart';
import '../core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const MyCartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  List<Map<String, dynamic>> get items => widget.cartItems;

  double get total => items.fold(
    0,
        (sum, item) =>
    sum +
        (item['price'] as double) * (item['quantity'] as int),
  );

  void increment(int i) {
    setState(() => items[i]['quantity']++);
  }

  void decrement(int i) {
    setState(() {
      if (items[i]['quantity'] > 1) {
        items[i]['quantity']--;
      }
    });
  }

  void remove(int i) {
    setState(() => items.removeAt(i));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                "My Cart",
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
                padding: EdgeInsets.all(16.w),
                itemCount: items.length,
                separatorBuilder: (_, _) =>
                Divider(height: 1.h, indent: 90.w),
                itemBuilder: (_, i) => _item(i),
              ),
            ),

            /// BUTTON
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
              child: SizedBox(
                width: double.infinity,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: () => _showCheckout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go to Checkout",
                        style: TextStyle(
                          color: AppColors.background,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.2),                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          "\$${total.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(int i) {
    final item = items[i];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [

          /// IMAGE
          Container(
            width: 70.w,
            height: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3F2),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(item['image']),
          ),

          SizedBox(width: 12.w),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// NAME + DELETE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => remove(i),
                      child: Icon(Icons.close, size: 18.sp),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                Text(
                  item['desc'],
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 10.h),

                /// COUNTER + PRICE
                Row(
                  children: [
                    _btn(Icons.remove, () => decrement(i), false),

                    SizedBox(width: 12.w),

                    Text(
                      '${item['quantity']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    _btn(Icons.add, () => increment(i), true),

                    const Spacer(),

                    Text(
                      "\$${item['price']}",
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

  Widget _btn(IconData icon, VoidCallback onTap, bool isPlus) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isPlus
              ? AppColors.primary
              : AppColors.textSecondary,
        ),
      ),
    );
  }

  void _showCheckout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.52,
          ),
          padding: EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 22.h),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP BAR
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 14.h),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 22.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Divider(height: 1.h),

              /// ROWS
              _row("Delivery", "Select Method"),
              _rowWithIcon("Payment", "assets/icons/card.svg"),
              _row("Promo Code", "Pick discount"),
              _row(
                "Total Cost",
                "\$${total.toStringAsFixed(2)}",
              ),

              /// TERMS
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      const TextSpan(
                        text:
                        "By placing an order you agree to our\n",
                      ),
                      TextSpan(
                        text: "Terms",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: " And "),
                      TextSpan(
                        text: "Conditions",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                        const OrderAcceptedScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ROW
  Widget _row(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.chevron_right,
                size: 18.sp,
              ),
            ],
          ),
        ),
        Divider(height: 1.h),
      ],
    );
  }

  /// ROW WITH SVG
  Widget _rowWithIcon(String title, String iconPath) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.chevron_right,
                size: 18.sp,
              ),
            ],
          ),
        ),
        Divider(height: 1.h),
      ],
    );
  }
}
