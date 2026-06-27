import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/data/grocery_data.dart';
import '../core/models/app_models.dart';
import '../core/theme/app_colors.dart';
import '../widgets/filter_checkbox_item.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late final Map<String, bool> categories = {
    for (final item in AppGroceryData.filterCategories) item: item == 'Eggs',
  };

  late final Map<String, bool> brands = {
    for (final item in AppGroceryData.filterBrands) item: item == 'Cocola',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.pageHorizontal,
                vertical: 12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                  Text(
                    AppStrings.filters,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.fieldBackground,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.categories,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 12.h),

                              ...categories.keys.map((key) {
                                return FilterCheckboxItem(
                                  text: key,
                                  value: categories[key]!,
                                  onChanged: (value) {
                                    setState(() {
                                      categories[key] = value ?? false;
                                    });
                                  },
                                );
                              }),

                              SizedBox(height: 24.h),

                              Text(
                                AppStrings.brand,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 12.h),

                              ...brands.keys.map((key) {
                                return FilterCheckboxItem(
                                  text: key,
                                  value: brands[key]!,
                                  onChanged: (value) {
                                    setState(() {
                                      brands[key] = value ?? false;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              FilterSelection(
                                categories: categories.entries
                                    .where((entry) => entry.value)
                                    .map((entry) => entry.key)
                                    .toList(),
                                brands: brands.entries
                                    .where((entry) => entry.value)
                                    .map((entry) => entry.key)
                                    .toList(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.cardRadius),
                            ),
                          ),
                          child: Text(
                            AppStrings.applyFilter,
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
}
