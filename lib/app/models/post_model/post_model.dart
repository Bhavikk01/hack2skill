import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel{

  const factory PostModel({
    required String postId,
    required String username,
    required String userUid,
    required String userDesc,
    required String postByPhoto,
    required DateTime postTime,
    required String postDesc,
    required String postPhoto,
    required List<String> likes,
    required List<Comments> comments,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) => _$PostModelFromJson(json);
}

@freezed
class Comments with _$Comments{

  const factory Comments({
    required String commentId,
    required String commentMessage,
    required String commentByUserName,
    required String commentByUserUid,
    required String commentByUserDesc,
  }) = _Comments;

  factory Comments.fromJson(Map<String, Object?> json) => _$CommentsFromJson(json);
}