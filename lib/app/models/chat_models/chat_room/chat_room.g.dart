// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      lastMessage: json['lastMessage'] as String,
      lastMessageBy: json['lastMessageBy'] as String,
      lastMessageTm: DateTime.parse(json['lastMessageTm'] as String),
      chatStatus: json['chatStatus'] as String,
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'users': instance.users,
      'lastMessage': instance.lastMessage,
      'lastMessageBy': instance.lastMessageBy,
      'lastMessageTm': instance.lastMessageTm.toIso8601String(),
      'chatStatus': instance.chatStatus,
    };
