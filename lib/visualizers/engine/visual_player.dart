import 'dart:async';
import 'package:flutter/material.dart';
import 'visual_step.dart';

class VisualPlayer extends StatefulWidget {
  final List<VisualStep> steps;

  const VisualPlayer({super.key, required this.steps});

  @override
  State<VisualPlayer> createState() => _VisualPlayerState();
}

class _VisualPlayerState extends State<VisualPlayer> {
  int index = 0;
  Timer? timer;

  void play() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      if (index < widget.steps.length - 1) {
        setState(() => index++);
      } else {
        pause();
      }
    });
  }

  void pause() {
    timer?.cancel();
    timer = null;
  }

  void reset() {
    pause();
    setState(() => index = 0);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[index];

    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: (step.state as List).map((e) {
            final active = step.highlight.contains(e);
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: active ? Colors.orange : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(e.toString()),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text(step.explanation, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: const Icon(Icons.play_arrow), onPressed: play),
            IconButton(icon: const Icon(Icons.pause), onPressed: pause),
            IconButton(icon: const Icon(Icons.replay), onPressed: reset),
          ],
        ),
      ],
    );
  }
}
