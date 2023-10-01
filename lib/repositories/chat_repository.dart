import 'package:localingo/entities/answer.dart';
import 'package:localingo/entities/conversation.dart';
import 'package:localingo/entities/question.dart';

import '../utils/api_client.dart';

abstract class ChatRepository {
  Future<List<Conversation>> getConversations();
  Future<Question> generateQuestion(String message);
}


class ChatRepositoryImpl implements ChatRepository {
  final String languageType;
  final APIClient apiClient = APIClient();

  ChatRepositoryImpl({required this.languageType});

  @override
  Future<List<Conversation>> getConversations() async {
    final response = await apiClient.get("conversations/${languageType}");
    if (response.statusCode == 200) {
      return List<Conversation>.from(
          response.data.map((element) => Conversation.fromJson(element)));
    } else {
      throw Exception(response.toString());
    }
  }

  @override
  Future<Question> generateQuestion(String message) async {
    final response = await apiClient
        .post("question", {"message": message, "language_type": languageType});
    if (response.statusCode == 200) {
      Question question = Question.fromJson(response.data);
      List<Answer> answers = List<Answer>.from(question.answers);
      answers.shuffle();
      return Question(
          question: question.question,
          answers: answers,
          explanation: question.explanation);
    } else {
      throw Exception(response.toString());
    }
  }
}
