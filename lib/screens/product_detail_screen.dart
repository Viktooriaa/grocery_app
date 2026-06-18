import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String desc;
  final double price;
  final String image;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavourite = false;
  bool _detailExpanded = true;
  int _currentImage = 0;

  double get _basePrice => widget.price;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Фото секція
                      Stack(
                        children: [
                          Container(
                            height: 280.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F3F2),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.r),
                                bottomRight: Radius.circular(24.r),
                              ),
                            ),
                            child: PageView.builder(
                              itemCount: 3,
                              onPageChanged: (i) =>
                                  setState(() => _currentImage = i),
                              itemBuilder: (context, i) => Padding(
                                padding: EdgeInsets.all(24.w),
                                child: Image.asset(
                                  widget.image,
                                  fit: BoxFit.contain,
                                  errorBuilder: (c, e, s) => Icon(
                                    Icons.image_not_supported_outlined,
                                    color: AppColors.border,
                                    size: 80.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Dots
                          Positioned(
                            bottom: 16.h,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                    (i) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.w),
                                  width: i == _currentImage ? 20.w : 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: i == _currentImage
                                        ?  AppColors.primary
                                        :  Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // назад
                          Positioned(
                            top: 12.h,
                            left: 16.w,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 22.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Share
                          Positioned(
                            top: 12.h,
                            right: 16.w,
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.ios_share,
                                size: 22.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // Назва + Favourite
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    widget.desc,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(
                                      () => _isFavourite = !_isFavourite),
                              child: Icon(
                                _isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isFavourite
                                    ? Colors.red
                                    :  AppColors.textSecondary,
                                size: 26.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Кількість + ціна
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            // Minus
                            GestureDetector(
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() => _quantity--);
                                }
                              },
                              child: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:  AppColors.border),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 18.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                '$_quantity',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),

                            // Plus
                            GestureDetector(
                              onTap: () => setState(() => _quantity++),
                              child: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:  AppColors.primary),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 18.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                            const Spacer(),

                            // Ціна
                            Text(
                              '\$${(_basePrice * _quantity).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Divider(color: AppColors.border),
                      ),

                      // Product Detail
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => setState(
                                      () => _detailExpanded = !_detailExpanded),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Product Detail',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Icon(
                                    _detailExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color:  AppColors.textPrimary,
                                  ),
                                ],
                              ),
                            ),
                            if (_detailExpanded) ...[
                              SizedBox(height: 10.h),
                              Text(
                                'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healtful And Varied Diet.',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.textSecondary,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Divider(color: AppColors.border),
                      ),

                      // Nutritions
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nutritions',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F3F2),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Text(
                                    '100gr',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Divider(color: AppColors.border),
                      ),

                      //  Review
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Review',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                      (i) => Icon(
                                    Icons.star,
                                    size: 18.sp,
                                    color: Color(0xFFF3A505),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Divider(color: AppColors.border),
                      ),

                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),

              // Add To Basket
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 58.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                    ),
                    child: Text(
                      'Add To Basket',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                        letterSpacing: 0.3.sp,
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
}
