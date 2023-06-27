import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_app/Screen/Cart_screen/Model/cart_model.dart';
import 'package:user_app/Utils/fire_helper.dart';

class CaartScreen extends StatefulWidget {
  const CaartScreen({Key? key}) : super(key: key);

  @override
  State<CaartScreen> createState() => _CaartScreenState();
}

class _CaartScreenState extends State<CaartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireHelper.fireHelper.readCart(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for(var x in snapshot.data!.docs){
                cartmodal c1 = cartmodal(
                  price: ,
                );
              }
              return ListTile(
                title: Text(""),
              );
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
