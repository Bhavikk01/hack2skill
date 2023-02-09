import 'package:chatty/app/screens/home_screens/Getx_helper/state.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  final state = HomeScreenState();
  HomeScreenController();

  pageChange(int index){
    state.index = index;
  }
}