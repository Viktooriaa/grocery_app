import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_sizes.dart';
import '../core/models/app_models.dart';
import '../core/providers/cart_provider.dart';
import '../core/theme/app_colors.dart';
import '../widgets/product_card.dart';
import 'filter_screen.dart';
import 'product_detail_screen.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  final GroceryCategory category;

  const CategoryScreen({
    super.key,
    required this.category,
  });

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  late List<Product> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.category.products;
  }

  void applyFilters(FilterSelection filters) {
    setState(() {
      filteredProducts = widget.category.products.where((product) {
        final matchCategory = filters.categories.isEmpty ||
            filters.categories.contains(product.name);
        final matchBrand =
            filters.brands.isEmpty || filters.brands.contains(product.name);

        return matchCategory && matchBrand;
      }).toList();
    });
  }

  void _openProduct(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

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
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.category.name.replaceAll('\n', ' '),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
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

                      if (result is FilterSelection) {
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
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.pageHorizontal,
                  vertical: 16.h,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppSizes.productGridColumns(context),
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: AppSizes.productAspectRatio(context),
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _openProduct(product),
                    onAdd: () {
                      ref.read(cartProvider.notifier).addProduct(product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
