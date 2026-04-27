import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/message.dart';

class ClaudeService {
  static const String _baseUrl = 'https://api.anthropic.com/v1/messages';
  static const String _model = 'claude-opus-4-5';
  static const int _maxTokens = 1024;

  String get _apiKey => dotenv.env['ANTHROPIC_API_KEY'] ?? '';

  Future<String> sendMessage({
    required List<Message> messages,
    String systemPrompt = 'You are a helpful assistant.',
  }) async {
    final formattedMessages = messages
        .map((m) => {'role': m.role, 'content': m.content})
        .toList();

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: jsonEncode({
        'model': _model,
        'max_tokens': _maxTokens,
        'system': systemPrompt,
        'messages': formattedMessages,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['content'][0]['text'] as String;
    } else {
      throw Exception('Claude API error: ${response.statusCode} - ${response.body}');
    }
  }
}