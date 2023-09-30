import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/enitity/conversation.dart';
import 'package:localingo/repository/chat_repository.dart';

ChatState useChatService(String languageType) {
  final chats = useState<List<Conversation>>([]);
  final score = useState<int>(0);
  final chatRepository = ChatRepository(languageType: languageType);

  void addMessage(String text) {
    chats.value = [...chats.value];
    score.value = score.value + 1;
  }

  Future<void> initConversation() async {
    final messages = await chatRepository.getConversations();
    chats.value = [...chats.value, ...messages];
    score.value = score.value + 1;
  }

  return ChatState(
      chats: chats.value,
      score: score.value,
      addMessage: addMessage,
      initConversation: initConversation);
}

class ChatState {
  final List<Conversation> chats;
  final int score;
  final void Function(String text) addMessage;
  Future<void> Function() initConversation;
  ChatState(
      {required this.chats,
      required this.score,
      required this.addMessage,
      required this.initConversation});
}
