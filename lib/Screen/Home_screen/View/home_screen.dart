import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screen/Home_screen/Model/home_model.dart';

import '../../../Utils/fire_helper.dart';
import '../Controller/home_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  FireHelper.fireHelper.Logout();
                  Get.offAndToNamed('/signin');
                },
                icon: Icon(Icons.logout_rounded),
              ),
            ],
            backgroundColor: Colors.black),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 35),
              child: Text(
                "Discover Your Best",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 45.sp,
                width: 250.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search_rounded, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search HeadPhones",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CarouselSlider.builder(
              itemCount: homeController.img.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset("${homeController.img[index]}");
              },
              options: CarouselOptions(autoPlay: true),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Popular",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ///////////////
            Expanded(
                child: StreamBuilder(
                  stream: FireHelper.fireHelper.readProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;
                      homeController.Productlist.clear();
                      String id = "";
                      for (var x in snapData!.docs) {
                        id = x.id;
                        Map? data = x.data() as Map;
                        Homemodel u2 = Homemodel(
                          name: data['name'],
                          price: data['price'],
                          rate: data['rate'],
                          img: data['image'],
                          id: id,
                          desc: data['desc'],
                          discoun: data['discount'],
                        );
                        homeController.Productlist.add(u2);
                      }
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: GridView.builder(
                          itemCount: homeController.Productlist.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 220),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Homemodel usremodel = Homemodel();
                                  Get.toNamed('/ditel',arguments: homeController.Productlist[index]);
                                },
                                child: Container(
                                  //height: 300.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      transform: GradientRotation(5),
                                      colors: [
                                        Color(0x5c3e424b),
                                        Color(0xff363941),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Image.network(
                                                "${homeController.Productlist[index].img}"),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: ListTile(
                                            title: Text(
                                              "${homeController.Productlist[index].name}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            subtitle: Text(
                                              "${homeController.Productlist[index].price}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
