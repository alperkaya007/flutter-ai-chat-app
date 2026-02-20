import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});
  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (i) => AnimationController(
      vsync: this, duration: Duration(milliseconds: 400 + i * 100),
    )..repeat(reverse: true));
  }

  @override
  void dispose() { for (final c in _controllers) c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) => AnimatedBuilder(
        animation: _controllers[i],
        builder: (_, __) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 8, height: 8 + _controllers[i].value * 6,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      )),
    );
  }
}
