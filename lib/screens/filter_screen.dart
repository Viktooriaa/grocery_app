import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final Map<String, bool> categories = {
    "Eggs": true,
    "Noodles & Pasta": false,
    "Chips & Crisps": false,
    "Fast Food": false,
  };

  final Map<String, bool> brands = {
    "Individual Collection": false,
    "Cocola": true,
    "Ifad": false,
    "Kazi Farmas": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [

            ///  HEADER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ),

            ///  BODY
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [

                      /// SCROLL
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// CATEGORIES
                              Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 12.h),

                              ...categories.keys.map((key) {
                                return _checkboxItem(
                                  key,
                                  categories[key]!,
                                      (val) {
                                    setState(() {
                                      categories[key] = val!;
                                    });
                                  },
                                );
                              }),

                              SizedBox(height: 24.h),

                              /// BRAND
                              Text(
                                "Brand",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 12.h),

                              ...brands.keys.map((key) {
                                return _checkboxItem(
                                  key,
                                  brands[key]!,
                                      (val) {
                                    setState(() {
                                      brands[key] = val!;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),

                      ///  BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "Apply Filter",
                            style: TextStyle(
                                color: AppColors.background,
                                fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                               ),
                          ),
                        ),
                      ),
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

  Widget _checkboxItem(String text, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor:  AppColors.primary,
        ),
        Text(
          text,
          style: TextStyle(
            color: value ?  AppColors.primary : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
