
import 'package:flutter/material.dart';
import 'package:hack2skill/app/auth/sign_in_screen.dart';
import 'package:hack2skill/app/config/router_path.dart';
import 'package:hack2skill/app/screens/chatting_room/chatting_room.dart';
import 'package:hack2skill/app/screens/chatting_room/chatting_space.dart';

import '../models/enum/chat_status.dart';
import '../screens/chatting_room/chat_page.dart';
import '../screens/home_screen/home_page.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) {
      switch (settings.name) {

        case RoutePaths.homePage:
          return const HomePage();

        case RoutePaths.chatPage:
          return const ChatPage();

        case RoutePaths.signInGoogle:
          return const SignInGoogle();

        case RoutePaths.chattingRoom:
          return ChattingRoom(
            chatStatus: settings.arguments as ChatStatus,
          );

        case RoutePaths.chattingSpace:
          return ChattingSpace(
            otherUser: (settings.arguments as Map<String, dynamic>)["otherUser"],
            chatRoomId: (settings.arguments as Map<String, dynamic>)["chatRoomId"],
            myProfilePic: (settings.arguments as Map<String, dynamic>)["myProfilePic"],
            myUserName: (settings.arguments as Map<String, dynamic>)["myUserName"],
            chatStatus: (settings.arguments as Map<String, dynamic>)["chatStatus"]
          );

        default:
          return const SignInGoogle();

      }
    }
  );
}