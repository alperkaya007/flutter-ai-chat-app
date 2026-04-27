import 'package:flutter/foundation.dart';
import '../models/message.dart';
import '../services/claude_service.dart';

class ChatProvider extends ChangeNotifier {
  final ClaudeService _claudeService = ClaudeService();
  final List<Message> _messages = [];
  bool _isLoading = false;
  String _systemPrompt = 'You are a helpful, friendly assistant.';

  List<Message> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  String get systemPrompt => _systemPrompt;

  void setSystemPrompt(String prompt) {
    _systemPrompt = prompt;
    notifyListeners();
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    final userMessage = Message(role: 'user', content: content.trim());
    _messages.add(userMessage);
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _claudeService.sendMessage(
        messages: _messages,
        systemPrompt: _systemPrompt,
      );

      final assistantMessage = Message(role: 'assistant', content: response);
      _messages.add(assistantMessage);
    } catch (e) {
      final errorMessage = Message(
        role: 'assistant',
        content: 'Sorry, something went wrong. Please try again.',
      );
      _messages.add(errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}