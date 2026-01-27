import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class ArrayVisualizer extends StatelessWidget {
  final String subtopic;

  const ArrayVisualizer({
    super.key,
    required this.subtopic,
  });

  List<VisualStep> _generateSteps() {
    if (subtopic.contains('Traversal')) {
      return _traversalSteps();
    }

    if (subtopic.contains('Insertion')) {
      return _insertionSteps();
    }

    if (subtopic.contains('Deletion')) {
      return _deletionSteps();
    }

    if (subtopic.contains('Update')) {
      return _updateSteps();
    }

    if (subtopic.contains('Searching')) {
      return _searchingSteps();
    }

    if (subtopic.contains('2D')) {
      return _twoDArraySteps();
    }

    return _oneDArrayIntro();
  }

  /* ================= 1D ARRAY INTRO ================= */
  List<VisualStep> _oneDArrayIntro() {
    final arr = [10, 20, 30, 40];

    return [
      VisualStep(
        state: arr,
        highlight: [0],
        explanation: 'Array stores elements in contiguous memory',
      ),
      VisualStep(
        state: arr,
        highlight: [1],
        explanation: 'Each element is accessed using index',
      ),
      VisualStep(
        state: arr,
        highlight: [3],
        explanation: 'Last index is length - 1',
      ),
    ];
  }

  /* ================= TRAVERSAL ================= */
  List<VisualStep> _traversalSteps() {
    final arr = [10, 20, 30, 40];
    final steps = <VisualStep>[];

    for (int i = 0; i < arr.length; i++) {
      steps.add(
        VisualStep(
          state: arr,
          highlight: [i],
          explanation: 'Access element ${arr[i]} at index $i',
        ),
      );
    }
    return steps;
  }

  /* ================= INSERTION ================= */
  List<VisualStep> _insertionSteps() {
    final arr = [10, 20, 30, 40];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [2],
        explanation: 'Shift elements to the right',
      ),
    );

    arr.insert(2, 25);

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [2],
        explanation: 'Insert 25 at index 2',
      ),
    );

    return steps;
  }

  /* ================= DELETION ================= */
  List<VisualStep> _deletionSteps() {
    final arr = [10, 20, 30, 40];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [1],
        explanation: 'Element 20 will be removed',
      ),
    );

    arr.removeAt(1);

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [],
        explanation: 'Shift elements left after deletion',
      ),
    );

    return steps;
  }

  /* ================= UPDATE ================= */
  List<VisualStep> _updateSteps() {
    final arr = [10, 20, 30, 40];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [2],
        explanation: 'Update element at index 2',
      ),
    );

    arr[2] = 35;

    steps.add(
      VisualStep(
        state: List.from(arr),
        highlight: [2],
        explanation: 'Value updated to 35',
      ),
    );

    return steps;
  }

  /* ================= SEARCHING ================= */
  List<VisualStep> _searchingSteps() {
    final arr = [10, 20, 30, 40];
    final steps = <VisualStep>[];
    final target = 30;

    for (int i = 0; i < arr.length; i++) {
      steps.add(
        VisualStep(
          state: arr,
          highlight: [i],
          explanation: 'Compare ${arr[i]} with $target',
        ),
      );

      if (arr[i] == target) {
        steps.add(
          VisualStep(
            state: arr,
            highlight: [i],
            explanation: 'Element found at index $i',
          ),
        );
        break;
      }
    }
    return steps;
  }

  /* ================= 2D ARRAY ================= */
  List<VisualStep> _twoDArraySteps() {
    final matrix = [
      [1, 2],
      [3, 4],
    ];

    return [
      VisualStep(
        state: matrix,
        highlight: [0, 0],
        explanation: 'Access element at row 0, column 0',
      ),
      VisualStep(
        state: matrix,
        highlight: [1, 1],
        explanation: 'Access element at row 1, column 1',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final steps = _generateSteps();

    if (steps.isEmpty) {
      return const Center(
        child: Text('Visualization not available'),
      );
    }

    return VisualPlayer(steps: steps);
  }
}
