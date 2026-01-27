import 'package:flutter/material.dart';
import 'array_cell.dart';
import 'array_caption.dart';

class ArrayVisualizer extends StatefulWidget {
  final String subtopic;

  const ArrayVisualizer({super.key, required this.subtopic});

  @override
  State<ArrayVisualizer> createState() => _ArrayVisualizerState();
}

class _ArrayVisualizerState extends State<ArrayVisualizer> {
  List<int> array = [10, 20, 30, 40];
  int activeIndex = -1;
  String caption = 'Array stores elements using index';
  bool playing = false;

  Future<void> playAnimation() async {
    if (playing) return;
    playing = true;

    /// Decide animation based on subtopic
    if (widget.subtopic.contains('Traversal')) {
      await _traversal();
    } else if (widget.subtopic.contains('Insertion')) {
      await _insertion();
    } else if (widget.subtopic.contains('Deletion')) {
      await _deletion();
    } else if (widget.subtopic.contains('Update')) {
      await _update();
    } else if (widget.subtopic.contains('Searching')) {
      await _search();
    } else {
      await _intro();
    }

    playing = false;
  }

  Future<void> _intro() async {
    setState(() => caption = 'Each element has a fixed index');
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<void> _traversal() async {
    setState(() => caption = 'Traversing array from index 0');

    for (int i = 0; i < array.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        activeIndex = i;
        caption = 'Accessing index $i → value ${array[i]}';
      });
    }

    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      activeIndex = -1;
      caption = 'Traversal completed';
    });
  }

  Future<void> _insertion() async {
    setState(() => caption = 'Shifting elements to the right');
    await Future.delayed(const Duration(milliseconds: 700));

    setState(() => array.insert(2, 25));
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => caption = 'Inserted 25 at index 2');
  }

  Future<void> _deletion() async {
    setState(() {
      activeIndex = 1;
      caption = 'Deleting element at index 1';
    });

    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      array.removeAt(1);
      activeIndex = -1;
      caption = 'Elements shifted left';
    });
  }

  Future<void> _update() async {
    setState(() {
      activeIndex = 2;
      caption = 'Updating value at index 2';
    });

    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      array[2] = 35;
      caption = 'Value updated to 35';
    });
  }

  Future<void> _search() async {
    const target = 30;
    setState(() => caption = 'Searching for 30');

    for (int i = 0; i < array.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        activeIndex = i;
        caption = 'Comparing ${array[i]} with $target';
      });

      if (array[i] == target) {
        await Future.delayed(const Duration(milliseconds: 600));
        setState(() {
          caption = 'Found at index $i';
        });
        break;
      }
    }
  }

  void reset() {
    setState(() {
      array = [10, 20, 30, 40];
      activeIndex = -1;
      caption = 'Array stores elements using index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// ARRAY ROW
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(array.length, (i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ArrayCell(
                  value: array[i],
                  index: i,
                  active: i == activeIndex,
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 24),

        /// CAPTION
        ArrayCaption(text: caption),

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
