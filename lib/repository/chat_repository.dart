import 'package:localingo/enitity/answer.dart';
import 'package:localingo/enitity/conversation.dart';
import 'package:localingo/enitity/question.dart';

import '../utils/api_client.dart';

class ChatRepository {
  final String languageType;
  final APIClient apiClient = APIClient();

  ChatRepository({required this.languageType});

  Future<List<Conversation>> getConversations() async {
    final response = await apiClient.get("conversations/${languageType}");
    if (response.statusCode == 200) {
      return List<Conversation>.from(
          response.data.map((element) => Conversation.fromJson(element)));
    } else {
      throw Exception(response.toString());
    }
  }

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
