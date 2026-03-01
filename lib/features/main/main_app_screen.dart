import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/constants/app_images.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/features/home/page/home_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('Explore')),
    Center(child: Text('Cart')),
    Center(child: Text('Favorite')),
    Center(child: Text('Account')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.homeIcon),
            activeIcon: CustomSvgPicture(
              path: AppImages.homeIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.searchIcon),
            activeIcon: CustomSvgPicture(
              path: AppImages.searchIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.cartIcon),
            activeIcon: CustomSvgPicture(
              path: AppImages.cartIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.favoriteIcon),
            activeIcon: CustomSvgPicture(
              path: AppImages.favoriteIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profileIcon),
            activeIcon: CustomSvgPicture(
              path: AppImages.profileIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
