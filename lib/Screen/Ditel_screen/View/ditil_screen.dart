import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screen/Home_screen/Model/home_model.dart';
import 'package:user_app/Utils/fire_helper.dart';

class DitilScreen extends StatefulWidget {
  const DitilScreen({Key? key}) : super(key: key);

  @override
  State<DitilScreen> createState() => _DitilScreenState();
}

class _DitilScreenState extends State<DitilScreen> {
  Homemodel m1 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(5),
                  colors: [
                    Color(0x5c3e424b),
                    Color(0xff363941),
                  ],
                ),
              ),
              height: 250.sp,
              width: double.infinity,
              child: Image.network("${m1.img}",fit: BoxFit.cover,height: 100,width: 100,),
            ),
              Container(
                height: 350.sp,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    transform: GradientRotation(5),
                    colors: [
                      Color(0x5c3e424b),
                      Color(0xff363941),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text("${m1.name}",style: TextStyle(color: Colors.white,fontSize: 30.sp),),margin: EdgeInsets.only(top: 25,left: 20),),
                    Container(
                        child: Text("₹ ${m1.price}",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(top:10,left: 20),),
                    Container(
                        child: Text("${m1.desc}",style: TextStyle(color: Colors.white),),margin: EdgeInsets.only(top:35,left: 20),),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            FireHelper.fireHelper.Userinsertdata(
                              desc: m1.desc,
                              name: m1.name,
                              price: m1.price,
                              image: m1.img,
                              rating: m1.rate,
                              discount: m1.discoun,
                              id: m1.id,
                            );
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                              transform: GradientRotation(5),
                              colors: [
                                Color(0x5c3e424b),
                                Color(0xff363941),
                              ],
                            ),),
                            child: Text("Cart",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                              transform: GradientRotation(5),
                              colors: [
                                Color(0x5c3e424b),
                                Color(0xff363941),
                              ],
                            ),),
                            child: Text("Buy",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    ),);
  }
}
