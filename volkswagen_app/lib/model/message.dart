// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  String messageContent;
  bool isUserMessage;
  String messageTime;
  ChatMessage({
    required this.messageContent,
    required this.isUserMessage,
    required this.messageTime,
  });

  ChatMessage copyWith({
    String? messageContent,
    bool? isUserMessage,
    String? messageTime,
  }) {
    return ChatMessage(
      messageContent: messageContent ?? this.messageContent,
      isUserMessage: isUserMessage ?? this.isUserMessage,
      messageTime: messageTime ?? this.messageTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageContent': messageContent,
      'isUserMessage': isUserMessage,
      'messageTime': messageTime,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageContent: map['messageContent'] as String,
      isUserMessage: map['isUserMessage'] as bool,
      messageTime: map['messageTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChatMessage(messageContent: $messageContent, isUserMessage: $isUserMessage, messageTime: $messageTime)';

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.messageContent == messageContent &&
        other.isUserMessage == isUserMessage &&
        other.messageTime == messageTime;
  }

  @override
  int get hashCode =>
      messageContent.hashCode ^ isUserMessage.hashCode ^ messageTime.hashCode;
}
