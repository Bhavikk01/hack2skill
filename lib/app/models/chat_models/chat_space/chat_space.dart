import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_space.freezed.dart';
part 'chat_space.g.dart';

@freezed
class ChatSpace with _$ChatSpace{

  const factory ChatSpace({
    required String sendBy,
    required String message,
    required DateTime messageTime,
    required String photoId,
  }) = _ChatSpace;

  factory ChatSpace.fromJson(Map<String, Object?> json) => _$ChatSpaceFromJson(json);
}