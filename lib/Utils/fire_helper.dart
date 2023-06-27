import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // login

  Future<String> SignUp({required email, required password}) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "failed";
    });
  }

  Future<String> SignIn({required email, required password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return "success";
    }).catchError((e) {
      return "failed";
    });
  }

  Future<String?> checkLogin() async {
    User? user = await firebaseAuth.currentUser;
    String? uid = user?.uid;

    return uid;
  }


  Future<String?> googleSignIn() async {
    String? msg;
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await firebaseAuth
        .signInWithCredential(credential)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");

    return msg;
  }

  // Database

  Future<void> Userinsertdata({
    name, price, desc, discount, rating, image, id
  }) async {
    User? user = await firebaseAuth.currentUser;
    String? uid = user?.uid;
    await firebaseFirestore.collection("Cart").doc("$uid").collection("cart").add(
      {
        "name": name,
        "price": price,
        "desc": desc,
        "discount": discount,
        "rating": rating,
        "image": image,
        "id": id
      },
    );
  }
  // --------Delete--------
  void diliteid(String id) {
    firebaseFirestore.collection("Product").doc(id).delete();
  }
  //--------Logout---------
  Logout() async {
    await firebaseAuth.signOut();
  }

  // ------------------Database--------------

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() {
    return firebaseFirestore.collection("Product").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readCart()  {
    User? user = firebaseAuth.currentUser;
    String? uid = user?.uid;
    print("=================================${uid}");
    return firebaseFirestore.collection("Cart").doc("$uid").collection('cart').snapshots();
  }
}
