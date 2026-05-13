import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddToCart;

  const HomeScreen({
    super.key,
    required this.onAddToCart,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBanner = 0;

  final List<Map<String, dynamic>> _exclusiveOffers = [
    {
      'name': 'Organic Bananas',
      'desc': '7pcs, Priceg',
      'price': 4.99,
      'image': 'assets/images/banana.png',
    },
    {
      'name': 'Red Apple',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/apple.png',
    },
    {
      'name': 'Organic Bananas',
      'desc': '7pcs, Priceg',
      'price': 4.99,
      'image': 'assets/images/banana.png',
    },
    {
      'name': 'Red Apple',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/apple.png',
    },
  ];

  final List<Map<String, dynamic>> _bestSelling = [
    {
      'name': 'Bell Pepper Red',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/pepper.png',
    },
    {
      'name': 'Ginger',
      'desc': '250gm, Priceg',
      'price': 4.99,
      'image': 'assets/images/ginger.png',
    },
    {
      'name': 'Bell Pepper Red',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/pepper.png',
    },
    {
      'name': 'Ginger',
      'desc': '250gm, Priceg',
      'price': 4.99,
      'image': 'assets/images/ginger.png',
    },
  ];

  final List<Map<String, dynamic>> _groceries = [
    {
      'name': 'Beef Bone',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/beef_bone.png',
    },
    {
      'name': 'Broiler Chicken',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/chicken.png',
    },
    {
      'name': 'Beef Bone',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/beef_bone.png',
    },
    {
      'name': 'Broiler Chicken',
      'desc': '1kg, Priceg',
      'price': 4.99,
      'image': 'assets/images/chicken.png',
    },
  ];

  final List<Map<String, dynamic>> _groceryCategories = [
    {
      'name': 'Pulses',
      'color': Color(0xFFF5ECD7),
      'image': 'assets/images/pulses.png',
    },
    {
      'name': 'Rice',
      'color': Color(0xFFE8F5E9),
      'image': 'assets/images/rice.png',
    },
  ];

  Widget _imageAsset(String path, double height) {
    return Image.asset(
      path,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: height,
        child: const Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.border,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Локація
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            // Морквина зверху
                            Center(
                              child: SvgPicture.asset(
                                'assets/icons/carrot_orange.svg',
                                height: 26,
                                errorBuilder: (c, e, s) => const Icon(
                                  Icons.local_grocery_store,
                                  size: 30,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Локація знизу з піном
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: AppColors.textPrimary,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Dhaka, Banassre',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Search
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
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Banner з PageView
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 120,
                          child: PageView(
                            onPageChanged: (i) =>
                                setState(() => _currentBanner = i),
                            children: [
                              _bannerItem('assets/images/banner.png'),
                              _bannerItem('assets/images/banner.png'),
                              _bannerItem('assets/images/banner.png'),
                            ],
                          ),
                        ),
                      ),

                      // Dots
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: i == _currentBanner ? 20 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: i == _currentBanner
                                  ?  AppColors.primary
                                  :  Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Exclusive Offer
                      _sectionHeader('Exclusive Offer'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _exclusiveOffers.length,
                          itemBuilder: (context, i) =>
                              _productCard(_exclusiveOffers[i]),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Best Selling
                      _sectionHeader('Best Selling'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _bestSelling.length,
                          itemBuilder: (context, i) =>
                              _productCard(_bestSelling[i]),
                        ),
                      ),

                      const SizedBox(height: 20),

                      //  Groceries
                      _sectionHeader('Groceries'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _groceryCategories.length,
                          itemBuilder: (context, i) =>
                              _groceryCategoryCard(_groceryCategories[i]),
                        ),
                      ),

                      const SizedBox(height: 16),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.75,
                            ),
                        itemCount: _groceries.length,
                        itemBuilder: (context, i) =>
                            _productCard(_groceries[i]),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerItem(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        color:  AppColors.primary,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => const SizedBox(),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'See all',
              style: TextStyle(fontSize: 14, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              name: item['name'],
              desc: item['desc'],
              price: item['price'],
              image: item['image'],
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:  AppColors.border, width: 0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _imageAsset(item['image'], 100)),
              const SizedBox(height: 8),
              Text(
                item['name'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item['desc'],
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${item['price'].toStringAsFixed(2)}",
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onAddToCart(item);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.add, color: AppColors.background, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _groceryCategoryCard(Map<String, dynamic> item) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: item['color'] as Color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SizedBox(
            width: 70,
            height: 70,
            child: _imageAsset(item['image'], 70),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item['name'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
