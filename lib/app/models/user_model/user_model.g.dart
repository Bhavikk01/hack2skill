// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      photoId: json['photoId'] as String,
      phoneNumber: json['phoneNumber'] as String,
      posts: (json['posts'] as List<dynamic>).map((e) => e as String).toList(),
      connections: (json['connections'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'photoId': instance.photoId,
      'phoneNumber': instance.phoneNumber,
      'posts': instance.posts,
      'connections': instance.connections,
    };
