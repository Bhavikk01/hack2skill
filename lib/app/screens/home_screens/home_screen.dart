import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chat_screens/chat_room.dart';
import '../create_post/create_post.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;
  List<Widget> navScreens = [
    const HomePage(),
    const ChatRoom(),
    const CreatePost(),
    const Text("Hello3"),
  ];

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = const Color(0xff041c50);
  Color unselectedColor = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: navScreens[_index],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        backgroundColor: Colors.black.withOpacity(0.1),
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
        snakeShape: snakeShape,
        shape: bottomBarShape,
        snakeViewColor: selectedColor,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined), label: 'Profile')
        ],
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10),
      ),
    );
  }
}
