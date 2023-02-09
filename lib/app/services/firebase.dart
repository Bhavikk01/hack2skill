
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/users/user_model.dart';
import '../store/user.dart';

class FirebaseFireStore extends GetxController{
  static FirebaseFireStore get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;


  Future<void> addUser(UserModel user)async{
    await fireStore.collection("Users").doc(user.uid).set(user.toJson());
  }

  /* This is the user services */
  Future<UserModel?> getUser(String uid) async {
    final doc = await fireStore.collection("Users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Stream<QuerySnapshot> getUserByUserName(String username) {
    return fireStore
        .collection("Users")
        .where("uid", isNotEqualTo: UserStore.to.uid)
        .where("username", isEqualTo: username)
        .snapshots();
  }

  Stream<List<UserModel>> getAllUsers() {
    return fireStore
        .collection("Users")
        .where("uid", isNotEqualTo: UserStore.to.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(
            (e) =>
            UserModel.fromJson(e.data())
    ).toList()
    );
  }

  Future<void> handleSignIn() async {
    User? user;
    UserModel? userModel;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
        userModel = await getUser(user!.uid);
        if(userModel == null){
          userModel = UserModel(
              uid: user.uid,
              username: user.displayName?? '',
              email: user.email?? '',
              photoId: user.photoURL?? '',
              phoneNumber: user.phoneNumber?? '',
              posts: [""],
              connections: [""]
          );
          await addUser(userModel);
          await UserStore.to.saveProfile(userModel);
        }else{
          await UserStore.to.saveProfile(userModel);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {

        }
        else if (e.code == 'invalid-credential') {

        }
      } catch (e) {
        log('$e Occurred');
      }
    }
  }
}