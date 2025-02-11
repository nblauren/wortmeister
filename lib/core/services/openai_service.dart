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
      String prompt, Map<String, String> structure) async {
    final response = await _openAIClient.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.modelId('gpt-4o'),
        messages: [
          ChatCompletionMessage.system(
            content: prompt,
          ),
        ],
        temperature: 0,
        responseFormat: ResponseFormat.jsonSchema(
          jsonSchema: JsonSchemaObject.fromJson(structure),
        ),
      ),
    );
    return response;
  }
}
