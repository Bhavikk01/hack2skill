import 'dart:developer';

import 'package:chatty/app/entities/user.dart';
import 'package:chatty/app/screens/auth_screens/Getx_helper/state.dart';
import 'package:chatty/app/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../models/users/user_model.dart';
import '../../../store/user.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'openid'
  ]
);

class SignInController extends GetxController{
  final state = SignInState();
  SignInController();

  Future<void> handleSignIn() async {
    await FirebaseFireStore.to.handleSignIn();
  }
}