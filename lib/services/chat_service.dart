import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/enitity/conversation.dart';
import 'package:localingo/repository/chat_repository.dart';

ChatState useChatService(String languageType) {
  final chats = useState<List<Conversation>>([]);
  final chatRepository = ChatRepository(languageType: languageType);

  void addMessage(String text) {
    chats.value = [...chats.value];
  }

  Future<void> continueConversation() async {
    final messages = await chatRepository.continueConversation(chats.value);
    chats.value = [...chats.value, ...messages];
  }
  
  Future<void> initConversation() async{
    final messages = await chatRepository.getInitConversation();
    chats.value = [...chats.value, ...messages];
    await continueConversation();
  }


  return ChatState(chats: chats.value, addMessage: addMessage, initConversation: initConversation);
}

class ChatState {
  final List<Conversation> chats;
  final void Function(String text) addMessage;
  Future<void> Function() initConversation;
  ChatState({required this.chats, required this.addMessage, required this.initConversation});
}
