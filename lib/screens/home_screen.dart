import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/data/grocery_data.dart';
import '../core/models/app_models.dart';
import '../core/providers/cart_provider.dart';
import '../core/theme/app_colors.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/grocery_category_card.dart';
import '../widgets/home_location_header.dart';
import '../widgets/product_card.dart';
import '../widgets/search_box.dart';
import '../widgets/section_header.dart';
import 'product_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentBanner = 0;

  void _openProduct(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  void _addToCart(Product product) {
    ref.read(cartProvider.notifier).addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              const HomeLocationHeader(),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.pageHorizontal,
                ),
                child: const SearchBox(),
              ),
              SizedBox(height: 16.h),
              BannerCarousel(
                currentBanner: _currentBanner,
                onChanged: (index) => setState(() => _currentBanner = index),
              ),
              SizedBox(height: 20.h),
              for (final section in AppGroceryData.homeSections) ...[
                SectionHeader(title: section.title),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.pageHorizontal,
                    ),
                    itemCount: section.products.length,
                    itemBuilder: (context, index) {
                      final product = section.products[index];
                      return ProductCard(
                        product: product,
                        width: 160.w,
                        margin: EdgeInsets.only(right: 12.w),
                        onTap: () => _openProduct(product),
                        onAdd: () => _addToCart(product),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
              const SectionHeader(title: AppStrings.groceries),
              SizedBox(height: 12.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.pageHorizontal,
                  ),
                  itemCount: AppGroceryData.groceryShortcuts.length,
                  itemBuilder: (context, index) => GroceryCategoryCard(
                    category: AppGroceryData.groceryShortcuts[index],
                    compact: true,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.pageHorizontal,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppSizes.productGridColumns(context),
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: AppSizes.productAspectRatio(context),
                  ),
                  itemCount: AppGroceryData.groceries.length,
                  itemBuilder: (context, index) {
                    final product = AppGroceryData.groceries[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _openProduct(product),
                      onAdd: () => _addToCart(product),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
