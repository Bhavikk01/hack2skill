// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  List<String> get users => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get lastMessageBy => throw _privateConstructorUsedError;
  DateTime get lastMessageTm => throw _privateConstructorUsedError;
  String get chatStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {List<String> users,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String chatStatus});
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? chatStatus = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageBy: null == lastMessageBy
          ? _value.lastMessageBy
          : lastMessageBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTm: null == lastMessageTm
          ? _value.lastMessageTm
          : lastMessageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$$_ChatRoomCopyWith(
          _$_ChatRoom value, $Res Function(_$_ChatRoom) then) =
      __$$_ChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> users,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String chatStatus});
}

/// @nodoc
class __$$_ChatRoomCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$_ChatRoom>
    implements _$$_ChatRoomCopyWith<$Res> {
  __$$_ChatRoomCopyWithImpl(
      _$_ChatRoom _value, $Res Function(_$_ChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? chatStatus = null,
  }) {
    return _then(_$_ChatRoom(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageBy: null == lastMessageBy
          ? _value.lastMessageBy
          : lastMessageBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTm: null == lastMessageTm
          ? _value.lastMessageTm
          : lastMessageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoom implements _ChatRoom {
  const _$_ChatRoom(
      {required final List<String> users,
      required this.lastMessage,
      required this.lastMessageBy,
      required this.lastMessageTm,
      required this.chatStatus})
      : _users = users;

  factory _$_ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomFromJson(json);

  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String lastMessage;
  @override
  final String lastMessageBy;
  @override
  final DateTime lastMessageTm;
  @override
  final String chatStatus;

  @override
  String toString() {
    return 'ChatRoom(users: $users, lastMessage: $lastMessage, lastMessageBy: $lastMessageBy, lastMessageTm: $lastMessageTm, chatStatus: $chatStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoom &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageBy, lastMessageBy) ||
                other.lastMessageBy == lastMessageBy) &&
            (identical(other.lastMessageTm, lastMessageTm) ||
                other.lastMessageTm == lastMessageTm) &&
            (identical(other.chatStatus, chatStatus) ||
                other.chatStatus == chatStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      lastMessage,
      lastMessageBy,
      lastMessageTm,
      chatStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      __$$_ChatRoomCopyWithImpl<_$_ChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom(
      {required final List<String> users,
      required final String lastMessage,
      required final String lastMessageBy,
      required final DateTime lastMessageTm,
      required final String chatStatus}) = _$_ChatRoom;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) = _$_ChatRoom.fromJson;

  @override
  List<String> get users;
  @override
  String get lastMessage;
  @override
  String get lastMessageBy;
  @override
  DateTime get lastMessageTm;
  @override
  String get chatStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
