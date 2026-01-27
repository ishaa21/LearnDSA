import 'package:flutter/material.dart';
import 'queue_box.dart';
import 'queue_caption.dart';

class QueueVisualizer extends StatefulWidget {
  final String subtopic;

  const QueueVisualizer({super.key, required this.subtopic});

  @override
  State<QueueVisualizer> createState() => _QueueVisualizerState();
}

class _QueueVisualizerState extends State<QueueVisualizer> {
  final List<int> queue = [];
  String caption = 'A queue follows FIFO order';
  bool playing = false;

  Future<void> playAnimation() async {
    if (playing) return;
    playing = true;

    setState(() => caption = 'Enqueue elements at the rear');

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => queue.add(10));

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => queue.add(20));

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => queue.add(30));

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => caption = 'Front element leaves first');

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      caption = 'Dequeue removes element from front';
      if (queue.isNotEmpty) queue.removeAt(0);
    });

    playing = false;
  }

  void reset() {
    setState(() {
      queue.clear();
      caption = 'A queue follows FIFO order';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// QUEUE AREA
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: queue.map((v) => QueueBox(value: v)).toList(),
          ),
        ),

        const SizedBox(height: 24),

        /// CAPTION
        QueueCaption(text: caption),

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
