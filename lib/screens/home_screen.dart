import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.border,
          size: 40.sp,
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
                      SizedBox(height: 16.h),

                      // Локація
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            // Морквина зверху
                            Center(
                              child: SvgPicture.asset(
                                'assets/icons/carrot_orange.svg',
                                height: 26.h,
                                errorBuilder: (c, e, s) => Icon(
                                  Icons.local_grocery_store,
                                  size: 30.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                            SizedBox(height: 12.h),

                            // Локація знизу з піном
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 18.sp,
                                  color: AppColors.textPrimary,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Dhaka, Banassre',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Search
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F3F2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Store',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.textSecondary,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14.h,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Banner з PageView
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SizedBox(
                          height: 120.h,
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
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: i == _currentBanner ? 20.w : 6.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: i == _currentBanner
                                  ?  AppColors.primary
                                  :  Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Exclusive Offer
                      _sectionHeader('Exclusive Offer'),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 220.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: _exclusiveOffers.length,
                          itemBuilder: (context, i) =>
                              _productCard(_exclusiveOffers[i]),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Best Selling
                      _sectionHeader('Best Selling'),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 220.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: _bestSelling.length,
                          itemBuilder: (context, i) =>
                              _productCard(_bestSelling[i]),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      //  Groceries
                      _sectionHeader('Groceries'),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: _groceryCategories.length,
                          itemBuilder: (context, i) =>
                              _groceryCategoryCard(_groceryCategories[i]),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12.h,
                              crossAxisSpacing: 12.w,
                              childAspectRatio: 0.75,
                            ),
                        itemCount: _groceries.length,
                        itemBuilder: (context, i) =>
                            _productCard(_groceries[i]),
                      ),

                      SizedBox(height: 20.h),
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
      borderRadius: BorderRadius.circular(16.r),
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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'See all',
              style: TextStyle(fontSize: 14.sp, color: AppColors.primary),
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
        width: 160.w,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color:  AppColors.border, width: 0.8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _imageAsset(item['image'], 100.h)),
              SizedBox(height: 8.h),
              Text(
                item['name'],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                item['desc'],
                style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
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
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.add, color: AppColors.background, size: 20.sp),
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
      width: 180.w,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: item['color'] as Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 12.w),
          SizedBox(
            width: 70.w,
            height: 70.h,
            child: _imageAsset(item['image'], 70.h),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              item['name'],
              style: TextStyle(
                fontSize: 14.sp,
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
