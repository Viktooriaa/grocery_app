import 'package:flutter/material.dart';
import 'package:grocery_app/screens/account_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/explore_screen.dart';
import 'package:grocery_app/screens/my_cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';
import 'favorites_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _cartItems = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final index = _cartItems.indexWhere(
            (item) => item['name'] == product['name'],
      );

      if (index != -1) {
        _cartItems[index]['quantity']++;
      } else {
        _cartItems.add({
          ...product,
          'quantity': 1,
        });
      }
    });
  }

  final List<Map<String, dynamic>> _navItems = [
    {'icon': 'assets/icons/shop.svg', 'label': 'Shop'},
    {'icon': 'assets/icons/explore.svg', 'label': 'Explore'},
    {'icon': 'assets/icons/cart.svg', 'label': 'Cart'},
    {'icon': 'assets/icons/favorite.svg', 'label': 'Favourite'},
    {'icon': 'assets/icons/account.svg', 'label': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(onAddToCart: addToCart),
          const ExploreScreen(),
          MyCartScreen(cartItems: _cartItems),
          FavoritesScreen(onAddToCart: addToCart),
          const AccountScreen(),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: Row(
            children: List.generate(_navItems.length, (i) {
              final selected = i == _selectedIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        _navItems[i]['icon'],
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          selected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _navItems[i]['label'],
                        style: TextStyle(
                          fontSize: 11,
                          color: selected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}