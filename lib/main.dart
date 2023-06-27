import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screen/Bottem_screen/View/bottem_screen.dart';
import 'package:user_app/Screen/Cart_screen/View/cart_screen.dart';
import 'package:user_app/Screen/Ditel_screen/View/ditil_screen.dart';
import 'package:user_app/Screen/Home_screen/View/home_screen.dart';
import 'package:user_app/Screen/Profile_screen/View/profile_screen.dart';
import 'package:user_app/Screen/SiginIn_screen/View/signin_screen.dart';
import 'package:user_app/Screen/SiginUp_screen/View/signup_screen.dart';
import 'package:user_app/Screen/Splesh/View/splesh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  // await NotaficationService.notaficationService.initmethod();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/home',
        getPages: [
          GetPage(name: '/', page: () => BottenScreen(),),
          GetPage(name: '/home', page: () => HomeScreen(),),
          GetPage(name: '/ditel', page: () => DitilScreen(),),
          GetPage(name: '/signin', page: () => SignInScreen(),),
          GetPage(name: '/signup', page: () => SignUpScreen(),),
          GetPage(name: '/splesh', page: () => SpleshScreen(),),
        ],
      ),
    ),
  );
}
