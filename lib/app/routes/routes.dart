
import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/screens/auth_screens/sign_in_google.dart';
import 'package:chatty/app/screens/welcome_screen/Getx_helper/bindings.dart';
import 'package:get/get.dart';

import '../screens/auth_screens/Getx_helper/bindings.dart';
import '../screens/chat_screens/chat_screen.dart';
import '../screens/welcome_screen/welcome_page.dart';

class RouteHelper{

  static List<GetPage> routes=[

    GetPage(
      name: RoutePaths.welcomePage,
      page: ()=> WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: RoutePaths.homePage,
      page: ()=> const ChatHomePage() ,
    ),

    GetPage(
      name: RoutePaths.signInGoogle,
      page: ()=> const SignInGoogle(),
      binding: SignInBinding(),
    ),
    //
    // GetPage(
    //   name: RoutePaths.chatPage,
    //   page: ()=> const HomePage(),
    //   binding: ,
    // ),
    //
    // GetPage(
    //   name: RoutePaths.chattingRoom,
    //   page: ()=> const HomePage(),
    //   binding: ,
    // ),
    //
    // GetPage(
    //   name: RoutePaths.chattingSpace,
    //   page: ()=> const HomePage(),
    //   binding: ,
    // ),
  ];
}