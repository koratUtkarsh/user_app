import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/Utils/fire_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rajister Your Account"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtid,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  label: Text("E-mail"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  label: Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String msg = await FireHelper.fireHelper.SignUp(
                  email: txtid.text,
                  password: txtpassword.text,
                );

                if (msg == "success") {
                  Get.back();
                }
                Get.snackbar(
                  "$msg",
                  "message",
                );
              },
              child: Text("Rajister"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("You have already account"),
            ),
          ],
        ),
      ),
    );
  }
}
