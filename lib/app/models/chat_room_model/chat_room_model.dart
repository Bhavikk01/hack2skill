import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel{

  const factory ChatRoomModel({
    required List<String> users,
    required String lastMessage,
    required String lastMessageBy,
    required String lastMessageTm,
    required String chatRoomId
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, Object?> json) => _$ChatRoomModelFromJson(json);
}