import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class LinkedListVisualizer extends StatelessWidget {
  final String subtopic;

  const LinkedListVisualizer({
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

    if (subtopic.contains('Reverse')) {
      return _reverseSteps();
    }

    if (subtopic.contains('DetectCycle')) {
      return _cycleDetectionSteps();
    }

    // Default: introduction
    return _introSteps();
  }

  /* ================= INTRO ================= */
  List<VisualStep> _introSteps() {
    final nodes = ['10', '20', '30'];
    return [
      VisualStep(
        state: nodes,
        highlight: ['10'],
        explanation: 'Head points to first node',
      ),
      VisualStep(
        state: nodes,
        highlight: ['20'],
        explanation: 'Each node stores data and next pointer',
      ),
      VisualStep(
        state: nodes,
        highlight: ['30'],
        explanation: 'Last node points to null',
      ),
    ];
  }

  /* ================= TRAVERSAL ================= */
  List<VisualStep> _traversalSteps() {
    final nodes = ['10', '20', '30', '40'];
    final steps = <VisualStep>[];

    for (final n in nodes) {
      steps.add(
        VisualStep(
          state: nodes,
          highlight: [n],
          explanation: 'Visiting node $n',
        ),
      );
    }
    return steps;
  }

  /* ================= INSERTION ================= */
  List<VisualStep> _insertionSteps() {
    final nodes = ['10', '20', '30'];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: List.from(nodes),
        highlight: ['20'],
        explanation: 'Find insertion position',
      ),
    );

    nodes.insert(2, '25');

    steps.add(
      VisualStep(
        state: List.from(nodes),
        highlight: ['25'],
        explanation: 'Insert node 25 between 20 and 30',
      ),
    );

    return steps;
  }

  /* ================= DELETION ================= */
  List<VisualStep> _deletionSteps() {
    final nodes = ['10', '20', '30', '40'];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: List.from(nodes),
        highlight: ['30'],
        explanation: 'Node 30 will be deleted',
      ),
    );

    nodes.remove('30');

    steps.add(
      VisualStep(
        state: List.from(nodes),
        highlight: [],
        explanation: 'Update links and remove node',
      ),
    );

    return steps;
  }

  /* ================= REVERSE ================= */
  List<VisualStep> _reverseSteps() {
    final steps = <VisualStep>[];

    final original = ['10', '20', '30'];
    steps.add(
      VisualStep(
        state: List.from(original),
        highlight: [],
        explanation: 'Original linked list',
      ),
    );

    final reversed = original.reversed.toList();
    steps.add(
      VisualStep(
        state: reversed,
        highlight: [],
        explanation: 'Pointers reversed',
      ),
    );

    return steps;
  }

  /* ================= CYCLE DETECTION ================= */
  List<VisualStep> _cycleDetectionSteps() {
    final nodes = ['10', '20', '30', '40'];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: nodes,
        highlight: ['10'],
        explanation: 'Slow pointer starts at head',
      ),
    );

    steps.add(
      VisualStep(
        state: nodes,
        highlight: ['30'],
        explanation: 'Fast pointer moves two steps',
      ),
    );

    steps.add(
      VisualStep(
        state: nodes,
        highlight: ['20', '20'],
        explanation: 'Pointers meet → cycle detected',
      ),
    );

    return steps;
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
