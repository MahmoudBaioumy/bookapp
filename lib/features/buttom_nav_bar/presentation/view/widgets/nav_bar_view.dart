import 'package:bookapp/core/resources/colors.dart';
import 'package:bookapp/core/resources/text_styles.dart';
import 'package:bookapp/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';
import '../../../../wishist/presentation/view/wishist_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}
 int _selectedIndex = 0;
 final List _pages = [
  const HomeView(),
  const CartView(),
  const WishistView(),
  const ProfileView(),
];
class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.bounceIn,
          rippleColor: Colors.grey,
          hoverColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: AppSize.s3,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: ColorsManager.bluecolor,
          textStyle: textStyle18(color: ColorsManager.white1color),
          tabs:  [
            GButton(
              iconSize: 28,
              icon: Icons.home,
              iconColor: ColorsManager.greycolor,
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              iconColor: ColorsManager.greycolor,
            ),
            GButton(
              iconSize: 28,
              icon: Icons.favorite_border,
              iconColor: ColorsManager.greycolor,
            ),
            GButton(
              iconSize: 29,
              icon: Icons.person,
              iconColor: ColorsManager.greycolor,
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
