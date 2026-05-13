import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class FavoritesScreen extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;

  const FavoritesScreen({
    super.key,
    required this.onAddToCart,
  });

  final List<Map<String, dynamic>> items = const [
    {
      'name': 'Sprite Can',
      'desc': '325ml, Price',
      'price': 1.50,
      'image': 'assets/images/sprite_can.png',
      'isAvailable': false,
    },
    {
      'name': 'Diet Coke',
      'desc': '355ml, Price',
      'price': 1.99,
      'image': 'assets/images/diet_cola.png',
      'isAvailable': true,
    },
    {
      'name': 'Apple & Grape Juice',
      'desc': '2L, Price',
      'price': 15.50,
      'image': 'assets/images/juice_apple_and_grape.png',
      'isAvailable': true,
    },
    {
      'name': 'Coca Cola Can',
      'desc': '325ml, Price',
      'price': 4.99,
      'image': 'assets/images/coca_cola_can.png',
      'isAvailable': true,
    },
    {
      'name': 'Pepsi Can',
      'desc': '330ml, Price',
      'price': 4.99,
      'image': 'assets/images/pepsi_can.png',
      'isAvailable': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [

              /// HEADER
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Favourite',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              const Divider(height: 1),

              /// LIST
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const Divider(
                    height: 1,
                    indent: 96,
                  ),
                  itemBuilder: (context, i) => _item(items[i]),
                ),
              ),

              /// BUTTON
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {

                      final unavailable = items.any(
                            (item) => item['isAvailable'] == false,
                      );

                      if (unavailable) {
                        _showErrorPopup(context);
                        return;
                      }

                      for (var item in items) {
                        onAddToCart(item);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Add All To Cart',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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

  /// ERROR POPUP
  void _showErrorPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// CLOSE
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ),

                const SizedBox(height: 16),

                /// IMAGE
                Image.asset(
                  'assets/images/error_page.png',
                  width: 180,
                ),

                const SizedBox(height: 28),

                /// TITLE
                const Text(
                  'Oops! Order Failed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 14),

                /// SUBTITLE
                const Text(
                  'Something went terribly wrong.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 32),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Please Try Again',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// BACK
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// ITEM
  Widget _item(Map<String, dynamic> item) {
    return SizedBox(
      height: 88,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// IMAGE
            SizedBox(
              width: 64,
              height: 64,
              child: Image.asset(
                item['image'],
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 16),

            /// TEXT
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// DESC
                  Text(
                    item['desc'],
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  /// OUT OF STOCK
                  if (item['isAvailable'] == false)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        'Out of stock',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// PRICE
            Row(
              children: [
                Text(
                  "\$${item['price'].toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.chevron_right,
                  size: 22,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}