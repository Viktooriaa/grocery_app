import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            ///  BODY
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      /// SCROLL
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// CATEGORIES
                              const Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 12),

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

                              const SizedBox(height: 24),

                              /// BRAND
                              const Text(
                                "Brand",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 12),

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
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Apply Filter",
                            style: TextStyle(
                                color: AppColors.background,
                                fontSize: 16,
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