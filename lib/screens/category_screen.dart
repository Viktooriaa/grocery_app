import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import 'filter_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  late List<Map<String, dynamic>> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void applyFilters(Map<String, dynamic> filters) {
    List categories = filters["categories"];
    List brands = filters["brands"];

    setState(() {
      filteredProducts = widget.products.where((product) {

        final matchCategory = categories.isEmpty ||
            categories.contains(product['name']);

        final matchBrand = brands.isEmpty ||
            brands.contains(product['name']);

        return matchCategory && matchBrand;

      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              //  AppBar
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      widget.categoryName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FilterScreen(),
                          ),
                        );

                        if (result != null) {
                          applyFilters(result);
                        }
                      },
                      child: Icon(
                        Icons.tune,
                        size: 22.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Продукти
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, i) =>
                      _productCard(context, filteredProducts[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productCard(BuildContext context, Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color:  AppColors.border, width: 0.8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item['image'],
                height: 100.h,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.border,
                  size: 40.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              item['name'],
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              item['desc'],
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${item['price'].toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color:  AppColors.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.background,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
