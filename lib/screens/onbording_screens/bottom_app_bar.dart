import 'package:e_commerce_app/constants/color_constants.dart';
import 'package:e_commerce_app/screens/dashboard_screens/cart.dart';
import 'package:e_commerce_app/screens/dashboard_screens/category.dart';
import 'package:e_commerce_app/screens/dashboard_screens/dashboard_home.dart';
import 'package:e_commerce_app/screens/dashboard_screens/like_products.dart';
import 'package:e_commerce_app/screens/dashboard_screens/user_profile.dart';
import 'package:flutter/material.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<StatefulWidget> createState() => BottomAppBarScreenSate();
}

class BottomAppBarScreenSate extends State<BottomAppBarScreen> {
  FloatingActionButtonLocation fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: fabLocation,
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: ColorsConstants.buttonThemeColor,
          elevation: 1,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
          },
          child: ImageIcon(
            AssetImage("assets/icons/ic_home.png"),
            size: 20,
            color: ColorsConstants.bgLightColor,
          )),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_menu.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LikeProductScreen()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_heart.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_cart.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_user.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
