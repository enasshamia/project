
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/model/user.dart';

import '../model/register_request.dart';

class FireStoreHelper {
  FireStoreHelper._();
  // final db = FirebaseFirestore.instance;

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<AppUser> saveUserInFirestore(RegisterRequest registerRequest) async {
    
    await firebaseFirestore
        .collection("users")
        .doc(registerRequest.id)
        .set(registerRequest.toMap());
    AppUser userModel = await getUserfromFirebase(registerRequest.id);

    return userModel;
  }


  Future<AppUser> getUserfromFirebase(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection("users").doc(userId).get();
    Map<String, dynamic> map = documentSnapshot.data();
    AppUser userModel = AppUser.fromMap(map);
  //  updateToken(userId: userModel.id);
    return userModel;
  }
}