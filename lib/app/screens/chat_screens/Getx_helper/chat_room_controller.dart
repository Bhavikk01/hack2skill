
import 'package:chatty/app/models/chat_room_model/chat_room_model.dart';
import 'package:chatty/app/services/firebase.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../store/user.dart';
import 'chat_room_state.dart';

class ChatRoomController extends GetxController{
  final state = ChatRoomState();

  final myUserId = UserStore.to.uid;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  onRefresh(){
    asyncLoadData().then((_) =>
        refreshController.refreshCompleted(resetFooterState: true)
    );
  }

  void onLoading(){
    asyncLoadData().then((_) =>
        refreshController.loadComplete()
    );
  }

  asyncLoadData() async {
    var chatRoomList = await FirebaseFireStore.to.getChatRoom();
    state.chatRoomList.clear();
    if(chatRoomList.docs.isNotEmpty){
      for(var chatRoom in chatRoomList.docs){
        Map<String, dynamic> chatRoomData = chatRoom.data() as Map<String, dynamic>;
        state.chatRoomList.add(
          ChatRoomModel.fromJson(chatRoomData)
        );
        if(chatRoomData['users'][0] == myUserId){
          state.otherUser.add(
            (await FirebaseFireStore.to.getUser(chatRoomData['users'][1]))!
          );
        }else{
          state.otherUser.add(
              (await FirebaseFireStore.to.getUser(chatRoomData['users'][0]))!
          );
        }
      }

    }
  }
}