import 'package:chatty/app/screens/components/animated_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../models/rive_assests.dart';


class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  RiveAssest selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: SafeArea(),
      body: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             ...List.generate(bottomNavs.length, (index) =>GestureDetector(
               onTap: (){
                 bottomNavs[index].input!.change(true);
                 if(bottomNavs[index] != selectedBottomNav) {
                   setState(() {
                     selectedBottomNav = bottomNavs[index];
                   });
                 }
                 Future.delayed(const Duration(seconds: 1),() {
                   bottomNavs[index].input!.change(false);
                 });
               },
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   AnimatedBar(
                       isActive: bottomNavs[index] == selectedBottomNav),
                   SizedBox(
                     height: 36,
                     width: 36,
                     child: Opacity(
                       opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                       child: RiveAnimation.asset(
                         //src is same for all
                         bottomNavs.first.src,
                         artboard: bottomNavs[index].artboard,
                         onInit: (artboard) {
                           setState(() {

                           });


                         },
                       ),
                     ),
                   ),
                 ],
               ),
             ),),
         ],
        ),
      ),
    );
  }
}


