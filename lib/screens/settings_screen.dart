import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _c;
  @override
  void initState() {
    super.initState();
    _c = TextEditingController(text: context.read<ChatProvider>().systemPrompt);
  }
  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('System Prompt', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(controller: _c, maxLines: 6, decoration: const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                context.read<ChatProvider>().setSystemPrompt(_c.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved')));
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
