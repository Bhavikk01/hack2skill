// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatSpace _$$_ChatSpaceFromJson(Map<String, dynamic> json) => _$_ChatSpace(
      sendBy: json['sendBy'] as String,
      message: json['message'] as String,
      messageTime: DateTime.parse(json['messageTime'] as String),
      photoId: json['photoId'] as String,
    );

Map<String, dynamic> _$$_ChatSpaceToJson(_$_ChatSpace instance) =>
    <String, dynamic>{
      'sendBy': instance.sendBy,
      'message': instance.message,
      'messageTime': instance.messageTime.toIso8601String(),
      'photoId': instance.photoId,
    };
