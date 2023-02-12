import 'package:rive/rive.dart';

class RiveAssest {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAssest(this.src,
      {required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input});

  set setInput(SMIBool status){
    input = status;
  }
}

List<RiveAssest> bottomNavs = [
  RiveAssest("assets/Icons/RiveAssets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "chat"),
  RiveAssest("assets/Icons/RiveAssets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "search"),
  RiveAssest("assets/Icons/RiveAssets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "chat"),
  RiveAssest("assets/Icons/RiveAssets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notification"),
  RiveAssest("assets/Icons/RiveAssets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile")
];
