import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom{

  const factory ChatRoom({
    required List<String> users,
    required String lastMessage,
    required String lastMessageBy,
    required DateTime lastMessageTm,
    required String chatStatus
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}