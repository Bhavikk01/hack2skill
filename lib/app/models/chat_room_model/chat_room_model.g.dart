// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomModel _$$_ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomModel(
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      lastMessage: json['lastMessage'] as String,
      lastMessageBy: json['lastMessageBy'] as String,
      lastMessageTm: json['lastMessageTm'] as String,
      chatRoomId: json['chatRoomId'] as String,
    );

Map<String, dynamic> _$$_ChatRoomModelToJson(_$_ChatRoomModel instance) =>
    <String, dynamic>{
      'users': instance.users,
      'lastMessage': instance.lastMessage,
      'lastMessageBy': instance.lastMessageBy,
      'lastMessageTm': instance.lastMessageTm,
      'chatRoomId': instance.chatRoomId,
    };
