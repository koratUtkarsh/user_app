import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/Utils/fire_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Your Account"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtid,
                decoration: InputDecoration(
                    hintText: "E-mail",
                    label: Text("E-mail"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
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
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // FireHelper.fireHelper.SignIn(email: "", password: "");
                String msg = await FireHelper.fireHelper.SignIn(
                  email: txtid.text,
                  password: txtpassword.text,
                );

                if (msg == "success") {
                  Get.offAndToNamed('/home');
                }
                Get.snackbar(
                  "$msg",
                  "message",
                );
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/signup');
              },
              child: Text("Creat Account"),
            ),
            SizedBox(height: 50,),
            IconButton(onPressed: () async {
             String? msg= await FireHelper.fireHelper.googleSignIn();
             Get.snackbar("$msg", "");
             Get.offAndToNamed('/');
            }, icon: Icon(Icons.grid_on_outlined))
          ],
        ),
      ),
    );
  }
}
