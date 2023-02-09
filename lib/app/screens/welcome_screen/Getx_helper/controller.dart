import 'package:chatty/app/screens/welcome_screen/Getx_helper/state.dart';
import 'package:chatty/app/store/config.dart';
import 'package:get/get.dart';

import '../../../routes/route_paths.dart';

class WelcomeController extends GetxController{
  final state = WelcomeState();
  WelcomeController();

  changePage(int index){
    state.index.value = index;
  }

  handleSignIn() async {
    Get.offAndToNamed(RoutePaths.signInGoogle);
  }
}