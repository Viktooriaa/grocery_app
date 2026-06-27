import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final bool isAvailable;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isAvailable = true,
  });
}

class GroceryCategory {
  final String name;
  final Color color;
  final String imagePath;
  final List<Product> products;

  const GroceryCategory({
    required this.name,
    required this.color,
    required this.imagePath,
    required this.products,
  });
}

class GrocerySection {
  final String title;
  final List<Product> products;

  const GrocerySection({
    required this.title,
    required this.products,
  });
}

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  double get subtotal => product.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class NavItem {
  final String iconPath;
  final String label;

  const NavItem({
    required this.iconPath,
    required this.label,
  });
}

class FilterSelection {
  final List<String> categories;
  final List<String> brands;

  const FilterSelection({
    required this.categories,
    required this.brands,
  });
}
