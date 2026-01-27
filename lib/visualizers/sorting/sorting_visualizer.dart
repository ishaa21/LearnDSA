import 'package:flutter/material.dart';
import 'sort_bar.dart';
import 'sort_caption.dart';

class SortingVisualizer extends StatefulWidget {
  final String subtopic;

  const SortingVisualizer({super.key, required this.subtopic});

  @override
  State<SortingVisualizer> createState() => _SortingVisualizerState();
}

class _SortingVisualizerState extends State<SortingVisualizer> {
  List<int> values = [5, 3, 8, 1, 4];
  int activeA = -1;
  int activeB = -1;
  String caption = 'Sorting arranges elements in order';
  bool playing = false;

  Future<void> playAnimation() async {
    if (playing) return;
    playing = true;

    if (widget.subtopic.contains('Selection')) {
      await _selectionSort();
    } else {
      await _bubbleSort(); // default
    }

    setState(() {
      activeA = -1;
      activeB = -1;
      caption = 'Array is now sorted';
    });

    playing = false;
  }

  Future<void> _bubbleSort() async {
    setState(() => caption = 'Bubble Sort compares adjacent elements');

    for (int i = 0; i < values.length; i++) {
      for (int j = 0; j < values.length - i - 1; j++) {
        setState(() {
          activeA = j;
          activeB = j + 1;
          caption = 'Comparing ${values[j]} and ${values[j + 1]}';
        });

        await Future.delayed(const Duration(milliseconds: 600));

        if (values[j] > values[j + 1]) {
          setState(() => caption = 'Swapping values');

          final temp = values[j];
          values[j] = values[j + 1];
          values[j + 1] = temp;

          await Future.delayed(const Duration(milliseconds: 600));
        }
      }
    }
  }

  Future<void> _selectionSort() async {
    setState(() => caption = 'Selection Sort selects minimum value');

    for (int i = 0; i < values.length; i++) {
      int minIndex = i;

      for (int j = i + 1; j < values.length; j++) {
        setState(() {
          activeA = minIndex;
          activeB = j;
          caption = 'Finding minimum element';
        });

        await Future.delayed(const Duration(milliseconds: 600));

        if (values[j] < values[minIndex]) {
          minIndex = j;
        }
      }

      final temp = values[minIndex];
      values[minIndex] = values[i];
      values[i] = temp;

      await Future.delayed(const Duration(milliseconds: 600));
    }
  }

  void reset() {
    setState(() {
      values = [5, 3, 8, 1, 4];
      activeA = -1;
      activeB = -1;
      caption = 'Sorting arranges elements in order';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// BARS
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(values.length, (i) {
              return SortBar(
                value: values[i],
                active: i == activeA || i == activeB,
              );
            }),
          ),
        ),

        const SizedBox(height: 24),

        /// CAPTION
        SortCaption(text: caption),

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
