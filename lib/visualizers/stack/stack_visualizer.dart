import 'package:flutter/material.dart';
import 'stack_plate.dart';
import 'stack_caption.dart';

class StackVisualizer extends StatefulWidget {
  final String subtopic;

  const StackVisualizer({super.key, required this.subtopic});

  @override
  State<StackVisualizer> createState() => _StackVisualizerState();
}

class _StackVisualizerState extends State<StackVisualizer> {
  final List<int> stack = [];
  String caption = 'Stack follows LIFO (Last In, First Out)';
  bool playing = false;

  static const double plateHeight = 46;

  Future<void> playAnimation() async {
    if (playing) return;
    playing = true;

    setState(() => caption = 'Pushing elements into stack');

    await _push(12);
    await _push(90);
    await _push(78);
    await _push(45);
    await _push(23);

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => caption = 'Pop removes the top element');

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => stack.removeLast());

    playing = false;
  }

  Future<void> _push(int value) async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => stack.add(value));
  }

  void reset() {
    setState(() {
      stack.clear();
      caption = 'Stack follows LIFO (Last In, First Out)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// STACK CONTAINER
        Container(
          width: 160,
          height: 300,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 3),
              right: BorderSide(width: 3),
              bottom: BorderSide(width: 3),
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              for (int i = 0; i < stack.length; i++)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  bottom: i * plateHeight,
                  child: StackPlate(value: stack[i]),
                ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        const Text(
          'Stack',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 24),

        /// CAPTION
        StackCaption(text: caption),

        const SizedBox(height: 24),

        /// CONTROLS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: playAnimation,
              child: const Text('Play'),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
