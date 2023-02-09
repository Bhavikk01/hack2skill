import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/services/services.dart';
import 'package:chatty/app/values/values.dart';
import 'package:get/get.dart';

import '../models/users/user_model.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String uid = '';
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
  void onInit() {
    super.onInit();
    uid = StorageService.to.getString(userIdKey);
    if (uid.isNotEmpty) {
      String name = StorageService.to.getString(userNameKey);
      String photoId = StorageService.to.getString(userProfilePicKey);
      String email = StorageService.to.getString(userEmailKey);
      _profile(_profile.value.copyWith(
        username: name,
        email: email,
        photoId: photoId,
        uid: uid,
      ));
      _isLogin.value = true;
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(userIdKey, value);
    uid = value;
  }

  Future<void> getProfile() async {
    if (uid.isEmpty) return ;
   String name = StorageService.to.getString(userNameKey);
   String userId = StorageService.to.getString(userIdKey);
   String photoId = StorageService.to.getString(userProfilePicKey);
   String email = StorageService.to.getString(userEmailKey);
   _profile(_profile.value.copyWith(
     username: name,
     email: email,
     photoId: photoId,
     uid: userId,
   ));
    _isLogin.value = true;
  }

  Future<void> saveProfile(UserModel profile) async {
    _isLogin.value = true;
    await StorageService.to.setString(userEmailKey, profile.email);
    await StorageService.to.setString(userProfilePicKey, profile.photoId);
    await StorageService.to.setString(userIdKey, profile.uid);
    await StorageService.to.setString(userNameKey, profile.username);
    _profile(profile);
    uid = profile.uid;
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
