import 'dart:developer';

import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/services/firebase.dart';
import 'package:get/get.dart';

import '../models/users/user_model.dart';
import '../services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String uid = '';
  String userIdKey = 'userIdKey';
  String userNameKey = 'userNameKey';
  String userProfilePicKey = 'userProfilePicKey';
  String userEmailKey = 'userEmailKey';
  final _profile = const UserModel(
    uid: '',
    photoId: '',
    connections: [],
    email: '',
    phoneNumber: '',
    posts: [],
    username: ''
  ).obs;

  bool get isLogin => _isLogin.value;
  UserModel get profile => _profile.value;
  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    getProfile();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(userIdKey, value);
    uid = value;
  }

  Future<void> getProfile() async {
    uid = StorageService.to.getString(userIdKey);
    if (uid.isNotEmpty) {
      _profile(await FirebaseFireStore.to.getUser(uid));
    }
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(userIdKey, profile);
    await getProfile();
    uid = profile;
    log("data is saved: ${_profile.value}");
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userEmailKey);
    await StorageService.to.remove(userIdKey);
    await StorageService.to.remove(userProfilePicKey);
    await StorageService.to.remove(userNameKey);
    _isLogin.value = false;
    uid = '';
    Get.offAllNamed(RoutePaths.signInGoogle);
  }
}
