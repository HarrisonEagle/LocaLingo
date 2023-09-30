
import 'package:dart_openai/dart_openai.dart';
import 'package:localingo/enitity/chat.dart';
import 'package:localingo/enitity/conversation.dart';

class ChatRepository{

  final String languageType;

  const ChatRepository({required this.languageType});

  Future<List<Conversation>> getInitConversation() async {
    OpenAIChatCompletionModel chatCompletion =
    await OpenAI.instance.chat.create(
      model: 'gpt-4',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: "あなたは${languageType}話者のAです。${this.languageType}で、Aさんであるあなたから始まりBさんから終わる会話を一件だけ出力してください。",
          role: OpenAIChatMessageRole.user,
        )
      ],
      temperature: 0,
      functions: [
        OpenAIFunctionModel.withParameters(
          name: 'get_localingo_conversation',
          description: '特定の方言の会話を生成する関数',
          parameters: [
            OpenAIFunctionProperty.array(name: "conversations", items: OpenAIFunctionProperty.object(name: "", properties: [OpenAIFunctionProperty.string(
              name: 'speaker',
              description: '話者',
              isRequired: true,
            ), OpenAIFunctionProperty.string(
              name: 'message',
              description: 'メッセージ',
            )])),
          ],
        ),
      ],
      functionCall: FunctionCall.forFunction('get_localingo_conversation'),
    );
    FunctionCallResponse? response = chatCompletion.choices.first.message.functionCall;
    if(response != null && response.arguments != null){
      final result = Chat.fromJson(response.arguments!);
      print(result);
      return result.conversations;
    }
    return [];
  }

  Future<List<Conversation>> continueConversation(List<Conversation> conversations) async {
    OpenAIChatCompletionModel chatCompletion =
    await OpenAI.instance.chat.create(
      model: 'gpt-4',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: "あなたは${languageType}話者のAです。今まであなたがBさんと${this.languageType}での会話履歴が与えられるので、それを元に${this.languageType}でBさんとの会話を続けてください。会話は1回だけ続けてください。",
          role: OpenAIChatMessageRole.system,
        ),
        ...conversations.map((e) => OpenAIChatCompletionChoiceMessageModel(
          content: e.message,
          role: e.speaker == "A" ? OpenAIChatMessageRole.assistant : OpenAIChatMessageRole.user,
        ))
      ],
      temperature: 0,
      functions: [
        OpenAIFunctionModel.withParameters(
          name: 'get_localingo_continue_conversation',
          description: '特定の方言の会話を生成する関数',
          parameters: [
            OpenAIFunctionProperty.array(name: "conversations", items: OpenAIFunctionProperty.object(name: "", properties: [OpenAIFunctionProperty.string(
              name: 'speaker',
              description: '話者',
              isRequired: true,
            ), OpenAIFunctionProperty.string(
              name: 'message',
              description: 'メッセージ',
            )])),
          ],
        ),
      ],
      functionCall: FunctionCall.forFunction('get_localingo_continue_conversation'),
    );
    FunctionCallResponse? response = chatCompletion.choices.first.message.functionCall;
    if(response != null && response.arguments != null){
      final result = Chat.fromJson(response.arguments!);
      print(result);
      return result.conversations;
    }
    return [];
  }



}