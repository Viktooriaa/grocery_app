import 'package:flutter/material.dart';
import 'package:grocery_app/screens/category_screen.dart';

import '../core/theme/app_colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Frash Fruits\n& Vegetable',
      'color': Color(0xFFE8F5E9),
      'image': 'assets/images/fruits_and_vegetable.png',
      'products': [
        {'name': 'Organic Bananas', 'desc': '7pcs, Price', 'price': 4.99, 'image': 'assets/images/banana.png'},
        {'name': 'Red Apple', 'desc': '1kg, Price', 'price': 4.99, 'image': 'assets/images/apple.png'},
        {'name': 'Bell Pepper', 'desc': '1kg, Price', 'price': 3.99, 'image': 'assets/images/pepper.png'},
        {'name': 'Ginger', 'desc': '250gm, Price', 'price': 2.99, 'image': 'assets/images/ginger.png'},
      ],
    },
    {
      'name': 'Cooking Oil\n& Ghee',
      'color': Color(0xFFFFF8E1),
      'image': 'assets/images/oil_and_ghee.png',
      'products': [
        {'name': 'Cooking Oil', 'desc': '1L, Price', 'price': 5.99, 'image': 'assets/images/oil_and_ghee.png'},
        {'name': 'Ghee', 'desc': '500g, Price', 'price': 8.99, 'image': 'assets/images/oil_and_ghee.png'},
      ],
    },
    {
      'name': 'Meat & Fish',
      'color': Color(0xFFFFEBEE),
      'image': 'assets/images/meat_and_fish.png',
      'products': [
        {'name': 'Beef Bone', 'desc': '1kg, Price', 'price': 4.99, 'image': 'assets/images/beef_bone.png'},
        {'name': 'Broiler Chicken', 'desc': '1kg, Price', 'price': 4.99, 'image': 'assets/images/chicken.png'},
        {'name': 'Meat & Fish', 'desc': '1kg, Price', 'price': 6.99, 'image': 'assets/images/meat_and_fish.png'},
      ],
    },
    {
      'name': 'Bakery & Snacks',
      'color': Color(0xFFFFF3E0),
      'image': 'assets/images/bakery_and_snacks.png',
      'products': [
        {'name': 'Bakery & Snacks', 'desc': '1kg, Price', 'price': 3.99, 'image': 'assets/images/bakery_and_snacks.png'},
        {'name': 'Pulses', 'desc': '500g, Price', 'price': 2.99, 'image': 'assets/images/pulses.png'},
      ],
    },
    {
      'name': 'Dairy & Eggs',
      'color': Color(0xFFFFF9E1),
      'image': 'assets/images/dairy_and_eggs.png',
      'products': [
        {'name': 'Dairy & Eggs', 'desc': '1kg, Price', 'price': 3.99, 'image': 'assets/images/dairy_and_eggs.png'},
      ],
    },
    {
      'name': 'Beverages',
      'color': Color(0xFFE8EAF6),
      'image': 'assets/images/beverages.png',
      'products': [
        {'name': 'Diet Cola', 'desc': '355ml, Price', 'price': 1.99, 'image': 'assets/images/diet_cola.png'},
        {'name': 'Sprite Can', 'desc': '325ml, Price', 'price': 1.50, 'image': 'assets/images/sprite_can.png'},
        {'name': 'Apple & Grape Juice', 'desc': '2L, Price', 'price': 15.99, 'image': 'assets/images/juice_apple_and_grape.png'},
        {'name': 'Orange Juice', 'desc': '2L, Price', 'price': 15.99, 'image': 'assets/images/orange_juice.png'},
        {'name': 'Coca Cola Can', 'desc': '325ml, Price', 'price': 4.99, 'image': 'assets/images/coca_cola_can.png'},
        {'name': 'Pepsi Can', 'desc': '330ml, Price', 'price': 4.99, 'image': 'assets/images/pepsi_can.png'},
      ],
    },
    {
      'name': 'Frash Fruits\n& Vegetable',
      'color': Color(0xFFE8F5E9),
      'image': 'assets/images/fruits_and_vegetable.png',
      'products': [
        {'name': 'Organic Bananas', 'desc': '7pcs, Price', 'price': 4.99, 'image': 'assets/images/banana.png'},
        {'name': 'Red Apple', 'desc': '1kg, Price', 'price': 4.99, 'image': 'assets/images/apple.png'},
        {'name': 'Bell Pepper', 'desc': '1kg, Price', 'price': 3.99, 'image': 'assets/images/pepper.png'},
        {'name': 'Ginger', 'desc': '250gm, Price', 'price': 2.99, 'image': 'assets/images/ginger.png'},
      ],
    },
    {
      'name': 'Cooking Oil\n& Ghee',
      'color': Color(0xFFFFF8E1),
      'image': 'assets/images/oil_and_ghee.png',
      'products': [
        {'name': 'Cooking Oil', 'desc': '1L, Price', 'price': 5.99, 'image': 'assets/images/oil_and_ghee.png'},
        {'name': 'Ghee', 'desc': '500g, Price', 'price': 8.99, 'image': 'assets/images/oil_and_ghee.png'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Find Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.textSecondary,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: _categories.length,
                    itemBuilder: (context, i) =>
                        _categoryCard(_categories[i]),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryName: item['name'].replaceAll('\n', ' '),
              products: List<Map<String, dynamic>>.from(item['products']),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item['color'] as Color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                item['image'],
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.border,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}