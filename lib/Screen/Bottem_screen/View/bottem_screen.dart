import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/Screen/Cart_screen/View/cart_screen.dart';
import 'package:user_app/Screen/Profile_screen/View/profile_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../Home_screen/Controller/home_controller.dart';
import '../../Home_screen/View/home_screen.dart';

class BottenScreen extends StatefulWidget {
  const BottenScreen({Key? key}) : super(key: key);

  @override
  State<BottenScreen> createState() => _BottenScreenState();
}

class _BottenScreenState extends State<BottenScreen> {
  HomeController homeController = Get.put(HomeController());
  List screen = [
    HomeScreen(),
    CaartScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: WaterDropNavBar(
        waterDropColor: Colors.black,
        inactiveIconColor: Colors.black54,
        backgroundColor: Colors.grey.shade500,
        barItems: [
        BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home,),
        BarItem(filledIcon: Icons.card_travel, outlinedIcon: Icons.card_travel,),
      ],
        selectedIndex: homeController.scr.value,
        onItemSelected: (index) {
          setState(() {
            homeController.scr.value = index;
          });
        },),
      body: screen[homeController.scr.value],
    ),);
  }
}
