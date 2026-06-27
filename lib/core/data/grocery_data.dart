import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_strings.dart';
import '../models/app_models.dart';
import '../theme/app_colors.dart';

class AppGroceryData {
  static const Product banana = Product(
    id: 'banana',
    name: 'Organic Bananas',
    description: '7pcs, Priceg',
    price: 4.99,
    imagePath: AppAssets.banana,
  );

  static const Product apple = Product(
    id: 'apple',
    name: 'Red Apple',
    description: '1kg, Priceg',
    price: 4.99,
    imagePath: AppAssets.apple,
  );

  static const Product pepper = Product(
    id: 'pepper',
    name: 'Bell Pepper Red',
    description: '1kg, Priceg',
    price: 4.99,
    imagePath: AppAssets.pepper,
  );

  static const Product ginger = Product(
    id: 'ginger',
    name: 'Ginger',
    description: '250gm, Priceg',
    price: 4.99,
    imagePath: AppAssets.ginger,
  );

  static const Product beefBone = Product(
    id: 'beef-bone',
    name: 'Beef Bone',
    description: '1kg, Priceg',
    price: 4.99,
    imagePath: AppAssets.beefBone,
  );

  static const Product chicken = Product(
    id: 'chicken',
    name: 'Broiler Chicken',
    description: '1kg, Priceg',
    price: 4.99,
    imagePath: AppAssets.chicken,
  );

  static const Product sprite = Product(
    id: 'sprite',
    name: 'Sprite Can',
    description: '325ml, Price',
    price: 1.50,
    imagePath: AppAssets.spriteCan,
    isAvailable: false,
  );

  static const Product dietCola = Product(
    id: 'diet-cola',
    name: 'Diet Coke',
    description: '355ml, Price',
    price: 1.99,
    imagePath: AppAssets.dietCola,
  );

  static const Product appleGrapeJuice = Product(
    id: 'apple-grape-juice',
    name: 'Apple & Grape Juice',
    description: '2L, Price',
    price: 15.50,
    imagePath: AppAssets.appleGrapeJuice,
  );

  static const Product orangeJuice = Product(
    id: 'orange-juice',
    name: 'Orange Juice',
    description: '2L, Price',
    price: 15.99,
    imagePath: AppAssets.orangeJuice,
  );

  static const Product cocaCola = Product(
    id: 'coca-cola',
    name: 'Coca Cola Can',
    description: '325ml, Price',
    price: 4.99,
    imagePath: AppAssets.cocaColaCan,
  );

  static const Product pepsi = Product(
    id: 'pepsi',
    name: 'Pepsi Can',
    description: '330ml, Price',
    price: 4.99,
    imagePath: AppAssets.pepsiCan,
  );

  static const Product cookingOil = Product(
    id: 'cooking-oil',
    name: 'Cooking Oil',
    description: '1L, Price',
    price: 5.99,
    imagePath: AppAssets.oilAndGhee,
  );

  static const Product ghee = Product(
    id: 'ghee',
    name: 'Ghee',
    description: '500g, Price',
    price: 8.99,
    imagePath: AppAssets.oilAndGhee,
  );

  static const Product bakerySnacks = Product(
    id: 'bakery-snacks',
    name: 'Bakery & Snacks',
    description: '1kg, Price',
    price: 3.99,
    imagePath: AppAssets.bakeryAndSnacks,
  );

  static const Product pulses = Product(
    id: 'pulses',
    name: 'Pulses',
    description: '500g, Price',
    price: 2.99,
    imagePath: AppAssets.pulses,
  );

  static const Product dairyEggs = Product(
    id: 'dairy-eggs',
    name: 'Dairy & Eggs',
    description: '1kg, Price',
    price: 3.99,
    imagePath: AppAssets.dairyAndEggs,
  );

  static const Product meatFish = Product(
    id: 'meat-fish',
    name: 'Meat & Fish',
    description: '1kg, Price',
    price: 6.99,
    imagePath: AppAssets.meatAndFish,
  );

  static const List<Product> exclusiveOffers = [
    banana,
    apple,
    banana,
    apple,
  ];

  static const List<Product> bestSelling = [
    pepper,
    ginger,
    pepper,
    ginger,
  ];

  static const List<Product> groceries = [
    beefBone,
    chicken,
    beefBone,
    chicken,
  ];

  static const List<Product> favoriteProducts = [
    sprite,
    dietCola,
    appleGrapeJuice,
    cocaCola,
    pepsi,
  ];

  static const List<GrocerySection> homeSections = [
    GrocerySection(
      title: AppStrings.exclusiveOffer,
      products: exclusiveOffers,
    ),
    GrocerySection(
      title: AppStrings.bestSelling,
      products: bestSelling,
    ),
  ];

  static const List<GroceryCategory> groceryShortcuts = [
    GroceryCategory(
      name: 'Pulses',
      color: Color(0xFFF5ECD7),
      imagePath: AppAssets.pulses,
      products: [pulses],
    ),
    GroceryCategory(
      name: 'Rice',
      color: Color(0xFFE8F5E9),
      imagePath: AppAssets.rice,
      products: [],
    ),
  ];

  static const List<GroceryCategory> categories = [
    GroceryCategory(
      name: 'Frash Fruits\n& Vegetable',
      color: AppColors.categoryGreen,
      imagePath: AppAssets.fruitsAndVegetable,
      products: [banana, apple, pepper, ginger],
    ),
    GroceryCategory(
      name: 'Cooking Oil\n& Ghee',
      color: AppColors.categoryYellow,
      imagePath: AppAssets.oilAndGhee,
      products: [cookingOil, ghee],
    ),
    GroceryCategory(
      name: 'Meat & Fish',
      color: AppColors.categoryRose,
      imagePath: AppAssets.meatAndFish,
      products: [beefBone, chicken, meatFish],
    ),
    GroceryCategory(
      name: 'Bakery & Snacks',
      color: AppColors.categoryOrange,
      imagePath: AppAssets.bakeryAndSnacks,
      products: [bakerySnacks, pulses],
    ),
    GroceryCategory(
      name: 'Dairy & Eggs',
      color: AppColors.categoryCream,
      imagePath: AppAssets.dairyAndEggs,
      products: [dairyEggs],
    ),
    GroceryCategory(
      name: 'Beverages',
      color: AppColors.categoryBlue,
      imagePath: AppAssets.beverages,
      products: [
        dietCola,
        sprite,
        appleGrapeJuice,
        orangeJuice,
        cocaCola,
        pepsi,
      ],
    ),
    GroceryCategory(
      name: 'Frash Fruits\n& Vegetable',
      color: AppColors.categoryGreen,
      imagePath: AppAssets.fruitsAndVegetable,
      products: [banana, apple, pepper, ginger],
    ),
    GroceryCategory(
      name: 'Cooking Oil\n& Ghee',
      color: AppColors.categoryYellow,
      imagePath: AppAssets.oilAndGhee,
      products: [cookingOil, ghee],
    ),
  ];

  static const List<NavItem> navItems = [
    NavItem(iconPath: AppAssets.shopIcon, label: 'Shop'),
    NavItem(iconPath: AppAssets.exploreIcon, label: 'Explore'),
    NavItem(iconPath: AppAssets.cartIcon, label: 'Cart'),
    NavItem(iconPath: AppAssets.favoriteIcon, label: 'Favourite'),
    NavItem(iconPath: AppAssets.accountIcon, label: 'Account'),
  ];

  static const List<NavItem> accountMenuItems = [
    NavItem(iconPath: AppAssets.ordersIcon, label: AppStrings.orders),
    NavItem(iconPath: AppAssets.myDetailsIcon, label: AppStrings.myDetails),
    NavItem(
      iconPath: AppAssets.deliveryAddressIcon,
      label: AppStrings.deliveryAddress,
    ),
    NavItem(
      iconPath: AppAssets.paymentMethodsIcon,
      label: AppStrings.paymentMethods,
    ),
    NavItem(iconPath: AppAssets.promoCodeIcon, label: AppStrings.promoCord),
    NavItem(iconPath: AppAssets.bellIcon, label: AppStrings.notifications),
    NavItem(iconPath: AppAssets.helpIcon, label: AppStrings.help),
    NavItem(iconPath: AppAssets.aboutIcon, label: AppStrings.about),
  ];

  static const List<String> filterCategories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  static const List<String> filterBrands = [
    'Individual Collection',
    'Cocola',
    'Ifad',
    'Kazi Farmas',
  ];
}
