import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack2skill/app/services/shared_preference.dart';

import '../models/chat_models/chat_room/chat_room.dart';
import '../models/user_model/user_model.dart';

class FirestoreService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<void> addPost(Product product) async {
  //   final docId = firestore.collection("products").doc().id;
  //   await firestore.collection("products").doc(docId).set(product.toMap(docId));
  // }

  // Stream<List<Post>> getPost(){
  //   return firestore
  //       .collection("Posts")
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) {
  //         final d = doc.data();
  //         return Post.fromMap(d);
  //   }).toList());
  // }

  Future<void> addUser(UserModel user)async{
    await firestore.collection("Users").doc(user.uid).set(user.toJson());
  }

  /* This is the user services */
  Future<UserModel?> getUser(String uid) async {
    final doc = await firestore.collection("Users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Stream<QuerySnapshot> getUserByUserName(String username) {
    return firestore
        .collection("Users")
        .where("username", isEqualTo: username)
        .snapshots();
  }

  Stream<List<UserModel>> getAllUsers() {
    return firestore
        .collection("Users")
        .snapshots()
        .map((snapshot) => snapshot.docs.map(
            (e) =>
                UserModel.fromJson(e.data())
        ).toList()
    );
  }

  /* This is the authentication services */
  Future<UserModel?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
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
          await SharedPreferenceHelper().saveUserEmail(user.email!);
          await SharedPreferenceHelper().saveUserId(user.uid);
          await SharedPreferenceHelper().saveUserName(user.displayName!);
          await SharedPreferenceHelper().saveUserProfileUrl(user.photoURL!);
          return userModel;
        }else{
          await SharedPreferenceHelper().saveUserEmail(user.email!);
          await SharedPreferenceHelper().saveUserId(user.uid);
          await SharedPreferenceHelper().saveUserName(user.displayName!);
          await SharedPreferenceHelper().saveUserProfileUrl(user.photoURL!);
          return userModel;
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
    return userModel;
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  /* This is the services for chatting feature */
  Future addMessage(
      String chatRoomId, String messageId, Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfoMap);
  }

  updateLastMessageSend(String chatRoomId, Map<String, dynamic> lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  Future<ChatRoom> createChatRoom(String chatRoomId, Map<String, dynamic> chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(chatRoomId)
        .get();

    if (snapShot.exists) {
      return ChatRoom.fromJson(snapShot.data()!);
    } else {
      FirebaseFirestore.instance
          .collection("chatRooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
      return ChatRoom.fromJson(chatRoomInfoMap);
    }
  }

  Stream<QuerySnapshot> getChatRoomMessages(chatRoomId) {
    return FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("messageTime", descending: true)
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getChatRooms(String myUsrId, String chatStatusToString) async {
    log(myUsrId);
    final dataStream = FirebaseFirestore.instance
        .collection("chatRooms");
    dataStream
        .where("users", arrayContains: myUsrId)
        .where("chatStatus", isEqualTo: chatStatusToString);
    return dataStream
        .where("lastMessage", isNotEqualTo: "")
        // .orderBy("lastMessageTm", descending: true)
        .snapshots();

  }

  Future<ChatRoom?> getChatRoomById(String chatRoomId) async {
    final doc = await firestore.collection("chatRooms").doc(chatRoomId).get();
    return doc.exists ? ChatRoom.fromJson(doc.data()!) : null;
  }
}