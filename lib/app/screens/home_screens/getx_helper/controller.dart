import 'dart:developer';

import 'package:chatty/app/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/post_model/post_model.dart';
import '../../../store/user.dart';
import 'library.dart';

class PostController extends GetxController{
  final state = PostState();
  Rx<bool> isLoading = true.obs;
  TextEditingController createPostController = TextEditingController();
  final RefreshController refreshController =RefreshController(initialRefresh: true);
  PostController();

  onRefresh(){
    getAllPosts().then((_) =>
        refreshController.refreshCompleted(resetFooterState: true)
    );
  }

  void onLoading(){
    // asyncLoadData().then((_) =>
    refreshController.loadComplete();
    // );
  }

  Future<void> getAllPosts() async {
    isLoading.value = true;
    if(!UserStore.to.isLogin){
      await UserStore.to.getProfile();
      log(UserStore.to.profile.toString());
    }else{
      log(UserStore.to.profile.toString());
    }
    state.posts.clear();
    var response = await FirebaseFireStore.to.getAllPosts(UserStore.to.profile.connections);
    for(var document in response.docs){
      state.posts
          .add(
          PostModel.fromJson(
              document.data() as Map<String, dynamic>)
      );
    }
    log('This is the length: ${state.posts.length}');
    isLoading.value = false;
  }

  Future<void> createPost() async {
    await FirebaseFireStore.to.addPosts(
      PostModel(
        postId: "postId",
        username: "username",
        userUid: UserStore.to.uid,
        userDesc: "userDesc",
        postByPhoto: UserStore.to.profile.photoId,
        postTime: DateTime.now(),
        postDesc: "postDesc",
        postPhoto: "postPhoto",
        likes: [],
        comments: [],
      )
    );
    log('Added successfully');
    await UserStore.to.saveProfile(UserStore.to.uid);
  }
}