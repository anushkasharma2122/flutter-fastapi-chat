class ChatMessage {
  final String sender;
  final String messageType; // "sender" or "receiver"
  final String messageContent;

  ChatMessage({
    required this.sender,
    required this.messageType,
    required this.messageContent,
  });
}
