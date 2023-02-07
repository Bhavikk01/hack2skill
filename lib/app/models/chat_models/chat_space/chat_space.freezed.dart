// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_space.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatSpace _$ChatSpaceFromJson(Map<String, dynamic> json) {
  return _ChatSpace.fromJson(json);
}

/// @nodoc
mixin _$ChatSpace {
  String get sendBy => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get messageTime => throw _privateConstructorUsedError;
  String get photoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSpaceCopyWith<ChatSpace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSpaceCopyWith<$Res> {
  factory $ChatSpaceCopyWith(ChatSpace value, $Res Function(ChatSpace) then) =
      _$ChatSpaceCopyWithImpl<$Res, ChatSpace>;
  @useResult
  $Res call(
      {String sendBy, String message, DateTime messageTime, String photoId});
}

/// @nodoc
class _$ChatSpaceCopyWithImpl<$Res, $Val extends ChatSpace>
    implements $ChatSpaceCopyWith<$Res> {
  _$ChatSpaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendBy = null,
    Object? message = null,
    Object? messageTime = null,
    Object? photoId = null,
  }) {
    return _then(_value.copyWith(
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoId: null == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatSpaceCopyWith<$Res> implements $ChatSpaceCopyWith<$Res> {
  factory _$$_ChatSpaceCopyWith(
          _$_ChatSpace value, $Res Function(_$_ChatSpace) then) =
      __$$_ChatSpaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sendBy, String message, DateTime messageTime, String photoId});
}

/// @nodoc
class __$$_ChatSpaceCopyWithImpl<$Res>
    extends _$ChatSpaceCopyWithImpl<$Res, _$_ChatSpace>
    implements _$$_ChatSpaceCopyWith<$Res> {
  __$$_ChatSpaceCopyWithImpl(
      _$_ChatSpace _value, $Res Function(_$_ChatSpace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendBy = null,
    Object? message = null,
    Object? messageTime = null,
    Object? photoId = null,
  }) {
    return _then(_$_ChatSpace(
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoId: null == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatSpace implements _ChatSpace {
  const _$_ChatSpace(
      {required this.sendBy,
      required this.message,
      required this.messageTime,
      required this.photoId});

  factory _$_ChatSpace.fromJson(Map<String, dynamic> json) =>
      _$$_ChatSpaceFromJson(json);

  @override
  final String sendBy;
  @override
  final String message;
  @override
  final DateTime messageTime;
  @override
  final String photoId;

  @override
  String toString() {
    return 'ChatSpace(sendBy: $sendBy, message: $message, messageTime: $messageTime, photoId: $photoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatSpace &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageTime, messageTime) ||
                other.messageTime == messageTime) &&
            (identical(other.photoId, photoId) || other.photoId == photoId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sendBy, message, messageTime, photoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatSpaceCopyWith<_$_ChatSpace> get copyWith =>
      __$$_ChatSpaceCopyWithImpl<_$_ChatSpace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatSpaceToJson(
      this,
    );
  }
}

abstract class _ChatSpace implements ChatSpace {
  const factory _ChatSpace(
      {required final String sendBy,
      required final String message,
      required final DateTime messageTime,
      required final String photoId}) = _$_ChatSpace;

  factory _ChatSpace.fromJson(Map<String, dynamic> json) =
      _$_ChatSpace.fromJson;

  @override
  String get sendBy;
  @override
  String get message;
  @override
  DateTime get messageTime;
  @override
  String get photoId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatSpaceCopyWith<_$_ChatSpace> get copyWith =>
      throw _privateConstructorUsedError;
}
