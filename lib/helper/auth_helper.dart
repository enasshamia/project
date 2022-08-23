import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:project/helper/firestorge_helper.dart';
import 'package:project/helper/route_helper.dart';
import 'package:project/model/register_request.dart';
import 'package:project/model/user.dart';
import 'package:project/screen/profile.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  AppUser appUser = AppUser();

  singup(RegisterRequest registerRequest) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: registerRequest.email, password: registerRequest.password);

      return userCredential;
    } on Exception catch (e) {
      //Logger().e(e);
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      var a = await FireStoreHelper.fireStoreHelper
          .getUserfromFirebase(userCredential.user.uid);
      appUser = await FireStoreHelper.fireStoreHelper
          .getUserfromFirebase(userCredential.user.uid);
      Get.offAll(ProfileScreen2(appUser));

      // return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        RouteHelper.routeHelper.showCustomDialougError(
            context, '  البريد الإلكتروني غير مسجل في التطبيق');
      } else if (e.code == 'wrong-password') {
        RouteHelper.routeHelper
            .showCustomDialougError(context, 'كلمة المرور خاطئة');
      }
    } catch (e) {
      //  Logger().e("Error in login: $e");
    }
  }

  logout() async {
    await firebaseAuth.signOut();
  }
}
