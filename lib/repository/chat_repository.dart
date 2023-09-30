
import 'package:localingo/enitity/conversation.dart';

import '../utils/api_client.dart';

class ChatRepository {
  final String languageType;
  final APIClient apiClient = APIClient();

  ChatRepository({required this.languageType});

  Future<List<Conversation>> getConversations() async {
    final response = await apiClient.get("conversations/${languageType}");
    if (response.statusCode == 200) {
      return List<Conversation>.from(response.data.map((element)=> Conversation.fromJson(element)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.toString());
    }
  }
}
