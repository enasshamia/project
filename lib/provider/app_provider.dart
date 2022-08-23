import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/helper/auth_helper.dart';
import 'package:project/helper/firestorge_helper.dart';
import 'package:project/helper/route_helper.dart';
import 'package:project/model/register_request.dart';
import 'package:project/model/user.dart';
import 'package:project/screen/login_screen.dart';
import 'package:project/screen/profile.dart';
import 'package:string_validator/string_validator.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController addressControlller = TextEditingController();
  TextEditingController widthControlller = TextEditingController();

  TextEditingController heightControlller = TextEditingController();

  nullValidate(String v) {
    if (v == null || v.isEmpty) {
      return 'الحقل مطلوب';
    }
  }

  validateEmail(String email) {
    if (email == null || email.isEmpty) {
      return "يرجى كتابة البريد الإلكتروني";
    } else if (!isEmail(email)) {
      return "يرجي كتابة البريد الإلكتروني بطريقة صحيحة";
    } else {
      return null;
    }
  }

  nullValidate2(String v) {
    if (v == null || v.isEmpty) {
      return ' يرجي كتابة رقم  للتواصل';
    }
  }

  validatePassword(String password) {
    if (password == null || password.isEmpty) {
      return 'يرجي كتابة كلمة المرور ';
    } else if (password.length < 6) {
      return 'يجب أن تكون كلمة المرور على الأقل ستة حروف ';
    } else {
      return null;
    }
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  Future<UserCredential> login(BuildContext context) async {
    if (loginKey.currentState.validate()) {
      RouteHelper.routeHelper.showCustomDialougloading(context, "جاري التحقق");
      UserCredential userCredential = await AuthHelper.authHelper
          .login(emailController.text, passwordController.text, context);
      return userCredential;
    }
  }

  registerNewUser(
    BuildContext context,
    UserCredential myCredintial,
  ) async {
    log('****************************');
    try {
      RegisterRequest registerRequest = RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
          userName: userNameController.text,
          phoneNumber: phoneController.text,
          address: addressControlller.text,
          width: widthControlller.text,
          height: heightControlller.text);

      RouteHelper.routeHelper
          .showCustomDialougloading(context, "يرجي الإنتظار");
      AppUser a;
      if (myCredintial == null) {
        UserCredential userCredential = await signup(registerRequest);
        registerRequest.id = userCredential.user.uid;

        setUserinFirestore(registerRequest);

        a = await FireStoreHelper.fireStoreHelper
            .getUserfromFirebase(userCredential.user.uid);
        Get.offAll(ProfileScreen2(a));
      } else {
        registerRequest.id = myCredintial.user.uid;
        registerRequest.email = myCredintial.user.email;
        registerRequest.userName = myCredintial.user.displayName;
        setUserinFirestore(registerRequest);
      }

      clearVariables();
      //SharedPref.instance.setUserLoginStatus(status: true);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      //    Utils.instance.snackError(body: e.message);

    }
  }

  logout() async {
    await AuthHelper.authHelper.logout();
    // SharedPref.instance.clear();
    Get.off(() => const LoginScreen());
    notifyListeners();
    //RouteHelper.routeHelper.goAndReplacePage( GettingStartedScreen.routename);
  }

  AppUser usermodel;
  getUserfromFirestore(String userId) async {
    usermodel =
        await FireStoreHelper.fireStoreHelper.getUserfromFirebase(userId);
    notifyListeners();
  }

  Future<UserCredential> signup(RegisterRequest registerRequest) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.singup(registerRequest);
    return userCredential;
  }

  Future<AppUser> setUserinFirestore(RegisterRequest registerRequest) async {
    FireStoreHelper.fireStoreHelper.saveUserInFirestore(registerRequest);
  }

  clearVariables() {
    userNameController.clear();
    addressControlller.clear();
    phoneController.clear();
    passwordController.clear();
    emailController.clear();
    minController.clear();
    notifyListeners();
  }
}
