// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      postId: json['postId'] as String,
      username: json['username'] as String,
      userUid: json['userUid'] as String,
      userDesc: json['userDesc'] as String,
      postByPhoto: json['postByPhoto'] as String,
      postTime: DateTime.parse(json['postTime'] as String),
      postDesc: json['postDesc'] as String,
      postPhoto: json['postPhoto'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'username': instance.username,
      'userUid': instance.userUid,
      'userDesc': instance.userDesc,
      'postByPhoto': instance.postByPhoto,
      'postTime': instance.postTime.toIso8601String(),
      'postDesc': instance.postDesc,
      'postPhoto': instance.postPhoto,
      'likes': instance.likes,
      'comments': instance.comments,
    };

_$_Comments _$$_CommentsFromJson(Map<String, dynamic> json) => _$_Comments(
      commentId: json['commentId'] as String,
      commentMessage: json['commentMessage'] as String,
      commentByUserName: json['commentByUserName'] as String,
      commentByUserUid: json['commentByUserUid'] as String,
      commentByUserDesc: json['commentByUserDesc'] as String,
    );

Map<String, dynamic> _$$_CommentsToJson(_$_Comments instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'commentMessage': instance.commentMessage,
      'commentByUserName': instance.commentByUserName,
      'commentByUserUid': instance.commentByUserUid,
      'commentByUserDesc': instance.commentByUserDesc,
    };
