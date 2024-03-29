import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/entities/conversation.dart';
import 'package:localingo/entities/question.dart';
import 'package:localingo/repositories/chat_repository.dart';
import 'package:localingo/entities/chat_element.dart';

ChatViewModel useChatViewModel(String languageType, ChatRepository chatRepository) {
  final conversations = useState<List<Conversation>>([]);
  final chats = useState<List<ChatElement>>([]);
  final nextElement = useState<ChatElement?>(null);
  final nextQuestionElement = useState<Question?>(null);
  final index = useState<int>(0);
  final text_index = useState<int>(0);
  final question_index = useState<int>(0);
  final score = useState<int>(0);

  useEffect(() {
    if (nextElement.value != null) {
      final currentChats = [...chats.value];
      final e = nextElement.value;
      final timer = Timer.periodic(
        const Duration(milliseconds: 50),
        (Timer t) {
          if (e is Conversation) {
            if (text_index.value < e.message.length) {
              if (text_index.value == 0) {
                index.value++;
                if (e.speaker == "A") {
                  nextQuestionElement.value = null;
                  chatRepository
                      .generateQuestion(
                          conversations.value[index.value].message)
                      .then((value) => nextQuestionElement.value = value);
                }
              }
              text_index.value++;
              chats.value = [
                ...currentChats,
                Conversation(
                    speaker: e.speaker,
                    message: e.message.substring(0, text_index.value))
              ];
            } else {
              if (e.speaker == "A" && nextQuestionElement.value != null) {
                nextElement.value = nextQuestionElement.value;
                text_index.value = 0;
                t.cancel();
                //nextElement.value = conversations.value[index.value];
              } else if (e.speaker == "B") {
                if (index.value < conversations.value.length) {
                  nextElement.value = conversations.value[index.value];
                  text_index.value = 0;
                }
                t.cancel();
              }
            }
          } else if (e is Question) {
            if (text_index.value < e.question.length) {
              text_index.value++;
              print(e.question.substring(0, text_index.value));
              chats.value = [
                ...currentChats,
                Question(
                    question: e.question.substring(0, text_index.value),
                    answers: [],
                    explanation: e.explanation)
              ];
            } else if (question_index.value < 4) {
              question_index.value++;
              chats.value = [
                ...currentChats,
                Question(
                    question: e.question,
                    answers: [...e.answers.sublist(0, question_index.value)],
                    explanation: e.explanation)
              ];
            } else {
              text_index.value = 0;
              question_index.value = 0;
              t.cancel();
            }
          }
        },
      );

      return () {
        timer.cancel();
      };
    }
  }, [nextElement.value]);

  Future<void> initConversation() async {
    conversations.value = await chatRepository.getConversations();
    nextElement.value = conversations.value[index.value];
  }

  bool continueConversation() {
    score.value++;
    if (index.value + 1 < conversations.value.length) {
      nextElement.value = conversations.value[index.value];
      return true;
    }
    return false;
  }

  return ChatViewModel(
      chats: chats.value,
      score: score.value,
      initConversation: initConversation,
      continueConversation: continueConversation);
}

class ChatViewModel {
  final List<ChatElement> chats;
  final int score;
  Future<void> Function() initConversation;
  final bool Function() continueConversation;
  ChatViewModel(
      {required this.chats,
      required this.score,
      required this.initConversation,
      required this.continueConversation});
}
