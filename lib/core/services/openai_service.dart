import 'package:openai_dart/openai_dart.dart';

class OpenAIService {
  final OpenAIClient _openAIClient;

  OpenAIService(String apiKey) : _openAIClient = OpenAIClient(apiKey: apiKey);

  Future<CreateChatCompletionResponse> getCompletion(String prompt) async {
    final response = await _openAIClient.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.modelId('gpt-4o'),
        messages: [
          ChatCompletionMessage.system(
            content: prompt,
          ),
        ],
        temperature: 0,
      ),
    );
    return response;
  }

  Future<CreateChatCompletionResponse> getCompletionWithStructuredOutput(
      String prompt, String userChat, Map<String, dynamic> structure) async {
    final response = await _openAIClient.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.modelId('gpt-4o-mini'),
        messages: [
          ChatCompletionMessage.system(
            content: prompt,
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              userChat,
            ),
          ),
        ],
        temperature: 0,
        responseFormat: ResponseFormat.jsonSchema(
          jsonSchema: JsonSchemaObject(
            name: 'word_prompt',
            description: "word structure",
            strict: true,
            schema: structure,
          ),
        ),
      ),
    );
    return response;
  }
}
