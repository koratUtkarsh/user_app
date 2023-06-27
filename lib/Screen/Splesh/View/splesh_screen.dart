import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/Utils/fire_helper.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed(FireHelper.fireHelper.checkLogin() == null?'/signin':'/');
    },);
    return SafeArea(child: Scaffold(
      body: Image.asset(""),
    ),);
  }
}
