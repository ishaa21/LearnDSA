import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class QueueVisualizer extends StatelessWidget {
  final String subtopic;

  const QueueVisualizer({
    super.key,
    required this.subtopic,
  });

  List<VisualStep> _generateSteps() {
    if (subtopic.contains('Circular')) {
      return _circularQueueSteps();
    }

    if (subtopic.contains('Deque')) {
      return _dequeSteps();
    }

    if (subtopic.contains('Priority')) {
      return _priorityQueueSteps();
    }

    if (subtopic.contains('Dequeue')) {
      return _dequeueSteps();
    }

    return _simpleQueueSteps();
  }

  /* ================= SIMPLE QUEUE ================= */
  List<VisualStep> _simpleQueueSteps() {
    final queue = <String>[];
    final steps = <VisualStep>[];

    for (final v in ['10', '20', '30']) {
      queue.add(v);
      steps.add(
        VisualStep(
          state: List.from(queue),
          highlight: [v],
          explanation: 'Enqueue $v at rear',
        ),
      );
    }

    return steps;
  }

  /* ================= DEQUEUE ================= */
  List<VisualStep> _dequeueSteps() {
    final queue = ['10', '20', '30'];
    final steps = <VisualStep>[];

    final removed = queue.removeAt(0);
    steps.add(
      VisualStep(
        state: List.from(queue),
        highlight: [],
        explanation: 'Dequeue $removed from front',
      ),
    );

    return steps;
  }

  /* ================= CIRCULAR QUEUE ================= */
  List<VisualStep> _circularQueueSteps() {
    final queue = ['10', '20', '30', ''];
    final steps = <VisualStep>[];

    steps.add(
      VisualStep(
        state: queue,
        highlight: [3],
        explanation: 'Rear wraps around to empty space',
      ),
    );

    queue[3] = '40';

    steps.add(
      VisualStep(
        state: List.from(queue),
        highlight: ['40'],
        explanation: 'Insert 40 at wrapped position',
      ),
    );

    return steps;
  }

  /* ================= DEQUE ================= */
  List<VisualStep> _dequeSteps() {
    final deque = <String>[];
    final steps = <VisualStep>[];

    deque.add('20');
    steps.add(
      VisualStep(
        state: List.from(deque),
        highlight: ['20'],
        explanation: 'Insert 20 at rear',
      ),
    );

    deque.insert(0, '10');
    steps.add(
      VisualStep(
        state: List.from(deque),
        highlight: ['10'],
        explanation: 'Insert 10 at front',
      ),
    );

    return steps;
  }

  /* ================= PRIORITY QUEUE ================= */
  List<VisualStep> _priorityQueueSteps() {
    final pq = <int>[];
    final steps = <VisualStep>[];

    for (final v in [30, 10, 20]) {
      pq.add(v);
      pq.sort();
      steps.add(
        VisualStep(
          state: List.from(pq),
          highlight: [v],
          explanation: 'Insert $v based on priority',
        ),
      );
    }

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
