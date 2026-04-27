# Flutter AI Chat App

A cross-platform AI chat application built with **Flutter & Dart**, powered by **Claude API**. Features real-time messaging, conversation history, and customizable AI personas.

## Features

- Real-time AI chat with Claude (Anthropic) API
- Conversation history with local persistence
- Multiple AI personas / system prompts
- Markdown rendering for AI responses
- Dark / Light theme support
- Cross-platform: iOS, Android

## Tech Stack

- **Flutter** 3.x
- **Dart** 3.x
- **Anthropic Claude API**
- **Hive** - local database for chat history
- **Provider** - state management
- **flutter_markdown** - markdown rendering

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- An Anthropic API key

### Installation

```bash
git clone https://github.com/alperkaya007/flutter-ai-chat-app.git
cd flutter-ai-chat-app
flutter pub get
```

Create a `.env` file in the root:

```
ANTHROPIC_API_KEY=your_api_key_here
```

Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
  models/
    message.dart
    conversation.dart
  services/
    claude_service.dart
    storage_service.dart
  providers/
    chat_provider.dart
  screens/
    chat_screen.dart
    home_screen.dart
    settings_screen.dart
  widgets/
    message_bubble.dart
    typing_indicator.dart
  main.dart
```

## Screenshots

Coming soon...

## Built With AI

This project was developed using **vibe coding** methodology with:
- Cursor IDE
- Claude (Anthropic)
- Gemini

---

Made by [Alper Kaya](https://github.com/alperkaya007)
