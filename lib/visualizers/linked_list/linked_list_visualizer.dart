import 'package:flutter/material.dart';
import 'node_widget.dart';
import 'arrow_painter.dart';

class LinkedListVisualizer extends StatefulWidget {
  final String subtopic;

  const LinkedListVisualizer({super.key, required this.subtopic});

  @override
  State<LinkedListVisualizer> createState() =>
      _LinkedListVisualizerState();
}

class _LinkedListVisualizerState extends State<LinkedListVisualizer> {
  List<int> nodes = [10, 20, 30];
  int activeIndex = -1;
  String caption = 'A linked list stores nodes using pointers';
  bool playing = false;

  Future<void> playAnimation() async {
    if (playing) return;
    playing = true;

    if (widget.subtopic.contains('Traversal')) {
      await _traversal();
    } else if (widget.subtopic.contains('Insertion')) {
      await _insertion();
    } else if (widget.subtopic.contains('Deletion')) {
      await _deletion();
    } else if (widget.subtopic.contains('Reverse')) {
      await _reverse();
    } else {
      await _intro();
    }

    playing = false;
  }

  Future<void> _intro() async {
    setState(() => caption = 'Each node points to the next node');
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<void> _traversal() async {
    setState(() => caption = 'Traversing linked list from head');

    for (int i = 0; i < nodes.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        activeIndex = i;
        caption = 'Visiting node ${nodes[i]}';
      });
    }

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      activeIndex = -1;
      caption = 'Traversal completed';
    });
  }

  Future<void> _insertion() async {
    setState(() => caption = 'Inserting new node');
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => nodes.insert(1, 15));
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => caption = 'Pointers updated to include new node');
  }

  Future<void> _deletion() async {
    setState(() {
      activeIndex = 1;
      caption = 'Deleting node ${nodes[1]}';
    });

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      nodes.removeAt(1);
      activeIndex = -1;
      caption = 'Pointers reconnected';
    });
  }

  Future<void> _reverse() async {
    setState(() => caption = 'Reversing pointers');
    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      nodes = nodes.reversed.toList();
      caption = 'Linked list reversed';
    });
  }

  void reset() {
    setState(() {
      nodes = [10, 20, 30];
      activeIndex = -1;
      caption = 'A linked list stores nodes using pointers';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// LIST VISUAL
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(nodes.length, (i) {
              return Row(
                children: [
                  NodeWidget(
                    value: nodes[i],
                    active: i == activeIndex,
                  ),
                  if (i != nodes.length - 1)
                    CustomPaint(
                      size: const Size(40, 20),
                      painter: ArrowPainter(),
                    ),
                ],
              );
            }),
          ),
        ),

        const SizedBox(height: 24),

        /// CAPTION
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Text(
            caption,
            key: ValueKey(caption),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

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
