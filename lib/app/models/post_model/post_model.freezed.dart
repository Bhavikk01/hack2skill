// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  String get postId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  String get userDesc => throw _privateConstructorUsedError;
  String get postByPhoto => throw _privateConstructorUsedError;
  DateTime get postTime => throw _privateConstructorUsedError;
  String get postDesc => throw _privateConstructorUsedError;
  String get postPhoto => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<Comments> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {String postId,
      String username,
      String userUid,
      String userDesc,
      String postByPhoto,
      DateTime postTime,
      String postDesc,
      String postPhoto,
      List<String> likes,
      List<Comments> comments});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? username = null,
    Object? userUid = null,
    Object? userDesc = null,
    Object? postByPhoto = null,
    Object? postTime = null,
    Object? postDesc = null,
    Object? postPhoto = null,
    Object? likes = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userDesc: null == userDesc
          ? _value.userDesc
          : userDesc // ignore: cast_nullable_to_non_nullable
              as String,
      postByPhoto: null == postByPhoto
          ? _value.postByPhoto
          : postByPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      postTime: null == postTime
          ? _value.postTime
          : postTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postDesc: null == postDesc
          ? _value.postDesc
          : postDesc // ignore: cast_nullable_to_non_nullable
              as String,
      postPhoto: null == postPhoto
          ? _value.postPhoto
          : postPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comments>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$$_PostModelCopyWith(
          _$_PostModel value, $Res Function(_$_PostModel) then) =
      __$$_PostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String username,
      String userUid,
      String userDesc,
      String postByPhoto,
      DateTime postTime,
      String postDesc,
      String postPhoto,
      List<String> likes,
      List<Comments> comments});
}

/// @nodoc
class __$$_PostModelCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$_PostModel>
    implements _$$_PostModelCopyWith<$Res> {
  __$$_PostModelCopyWithImpl(
      _$_PostModel _value, $Res Function(_$_PostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? username = null,
    Object? userUid = null,
    Object? userDesc = null,
    Object? postByPhoto = null,
    Object? postTime = null,
    Object? postDesc = null,
    Object? postPhoto = null,
    Object? likes = null,
    Object? comments = null,
  }) {
    return _then(_$_PostModel(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userDesc: null == userDesc
          ? _value.userDesc
          : userDesc // ignore: cast_nullable_to_non_nullable
              as String,
      postByPhoto: null == postByPhoto
          ? _value.postByPhoto
          : postByPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      postTime: null == postTime
          ? _value.postTime
          : postTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postDesc: null == postDesc
          ? _value.postDesc
          : postDesc // ignore: cast_nullable_to_non_nullable
              as String,
      postPhoto: null == postPhoto
          ? _value.postPhoto
          : postPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comments>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  const _$_PostModel(
      {required this.postId,
      required this.username,
      required this.userUid,
      required this.userDesc,
      required this.postByPhoto,
      required this.postTime,
      required this.postDesc,
      required this.postPhoto,
      required final List<String> likes,
      required final List<Comments> comments})
      : _likes = likes,
        _comments = comments;

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  final String postId;
  @override
  final String username;
  @override
  final String userUid;
  @override
  final String userDesc;
  @override
  final String postByPhoto;
  @override
  final DateTime postTime;
  @override
  final String postDesc;
  @override
  final String postPhoto;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<Comments> _comments;
  @override
  List<Comments> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'PostModel(postId: $postId, username: $username, userUid: $userUid, userDesc: $userDesc, postByPhoto: $postByPhoto, postTime: $postTime, postDesc: $postDesc, postPhoto: $postPhoto, likes: $likes, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModel &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.userDesc, userDesc) ||
                other.userDesc == userDesc) &&
            (identical(other.postByPhoto, postByPhoto) ||
                other.postByPhoto == postByPhoto) &&
            (identical(other.postTime, postTime) ||
                other.postTime == postTime) &&
            (identical(other.postDesc, postDesc) ||
                other.postDesc == postDesc) &&
            (identical(other.postPhoto, postPhoto) ||
                other.postPhoto == postPhoto) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      username,
      userUid,
      userDesc,
      postByPhoto,
      postTime,
      postDesc,
      postPhoto,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      __$$_PostModelCopyWithImpl<_$_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel(
      {required final String postId,
      required final String username,
      required final String userUid,
      required final String userDesc,
      required final String postByPhoto,
      required final DateTime postTime,
      required final String postDesc,
      required final String postPhoto,
      required final List<String> likes,
      required final List<Comments> comments}) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  String get postId;
  @override
  String get username;
  @override
  String get userUid;
  @override
  String get userDesc;
  @override
  String get postByPhoto;
  @override
  DateTime get postTime;
  @override
  String get postDesc;
  @override
  String get postPhoto;
  @override
  List<String> get likes;
  @override
  List<Comments> get comments;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return _Comments.fromJson(json);
}

/// @nodoc
mixin _$Comments {
  String get commentId => throw _privateConstructorUsedError;
  String get commentMessage => throw _privateConstructorUsedError;
  String get commentByUserName => throw _privateConstructorUsedError;
  String get commentByUserUid => throw _privateConstructorUsedError;
  String get commentByUserDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsCopyWith<Comments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsCopyWith<$Res> {
  factory $CommentsCopyWith(Comments value, $Res Function(Comments) then) =
      _$CommentsCopyWithImpl<$Res, Comments>;
  @useResult
  $Res call(
      {String commentId,
      String commentMessage,
      String commentByUserName,
      String commentByUserUid,
      String commentByUserDesc});
}

/// @nodoc
class _$CommentsCopyWithImpl<$Res, $Val extends Comments>
    implements $CommentsCopyWith<$Res> {
  _$CommentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? commentMessage = null,
    Object? commentByUserName = null,
    Object? commentByUserUid = null,
    Object? commentByUserDesc = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      commentMessage: null == commentMessage
          ? _value.commentMessage
          : commentMessage // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserName: null == commentByUserName
          ? _value.commentByUserName
          : commentByUserName // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserUid: null == commentByUserUid
          ? _value.commentByUserUid
          : commentByUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserDesc: null == commentByUserDesc
          ? _value.commentByUserDesc
          : commentByUserDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentsCopyWith<$Res> implements $CommentsCopyWith<$Res> {
  factory _$$_CommentsCopyWith(
          _$_Comments value, $Res Function(_$_Comments) then) =
      __$$_CommentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String commentId,
      String commentMessage,
      String commentByUserName,
      String commentByUserUid,
      String commentByUserDesc});
}

/// @nodoc
class __$$_CommentsCopyWithImpl<$Res>
    extends _$CommentsCopyWithImpl<$Res, _$_Comments>
    implements _$$_CommentsCopyWith<$Res> {
  __$$_CommentsCopyWithImpl(
      _$_Comments _value, $Res Function(_$_Comments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? commentMessage = null,
    Object? commentByUserName = null,
    Object? commentByUserUid = null,
    Object? commentByUserDesc = null,
  }) {
    return _then(_$_Comments(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      commentMessage: null == commentMessage
          ? _value.commentMessage
          : commentMessage // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserName: null == commentByUserName
          ? _value.commentByUserName
          : commentByUserName // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserUid: null == commentByUserUid
          ? _value.commentByUserUid
          : commentByUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      commentByUserDesc: null == commentByUserDesc
          ? _value.commentByUserDesc
          : commentByUserDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comments implements _Comments {
  const _$_Comments(
      {required this.commentId,
      required this.commentMessage,
      required this.commentByUserName,
      required this.commentByUserUid,
      required this.commentByUserDesc});

  factory _$_Comments.fromJson(Map<String, dynamic> json) =>
      _$$_CommentsFromJson(json);

  @override
  final String commentId;
  @override
  final String commentMessage;
  @override
  final String commentByUserName;
  @override
  final String commentByUserUid;
  @override
  final String commentByUserDesc;

  @override
  String toString() {
    return 'Comments(commentId: $commentId, commentMessage: $commentMessage, commentByUserName: $commentByUserName, commentByUserUid: $commentByUserUid, commentByUserDesc: $commentByUserDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comments &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.commentMessage, commentMessage) ||
                other.commentMessage == commentMessage) &&
            (identical(other.commentByUserName, commentByUserName) ||
                other.commentByUserName == commentByUserName) &&
            (identical(other.commentByUserUid, commentByUserUid) ||
                other.commentByUserUid == commentByUserUid) &&
            (identical(other.commentByUserDesc, commentByUserDesc) ||
                other.commentByUserDesc == commentByUserDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commentId, commentMessage,
      commentByUserName, commentByUserUid, commentByUserDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsCopyWith<_$_Comments> get copyWith =>
      __$$_CommentsCopyWithImpl<_$_Comments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentsToJson(
      this,
    );
  }
}

abstract class _Comments implements Comments {
  const factory _Comments(
      {required final String commentId,
      required final String commentMessage,
      required final String commentByUserName,
      required final String commentByUserUid,
      required final String commentByUserDesc}) = _$_Comments;

  factory _Comments.fromJson(Map<String, dynamic> json) = _$_Comments.fromJson;

  @override
  String get commentId;
  @override
  String get commentMessage;
  @override
  String get commentByUserName;
  @override
  String get commentByUserUid;
  @override
  String get commentByUserDesc;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsCopyWith<_$_Comments> get copyWith =>
      throw _privateConstructorUsedError;
}
