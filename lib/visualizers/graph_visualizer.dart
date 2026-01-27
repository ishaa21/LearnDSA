import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class GraphVisualizer extends StatelessWidget {
  final String subtopic;

  const GraphVisualizer({
    super.key,
    required this.subtopic,
  });

  List<VisualStep> _generateSteps() {
    if (subtopic.contains('BFS')) {
      return _bfsSteps();
    }

    if (subtopic.contains('DFS')) {
      return _dfsSteps();
    }

    if (subtopic.contains('Cycle')) {
      return _cycleDetectionSteps();
    }

    if (subtopic.contains('Spanning')) {
      return _mstSteps();
    }

    return _representationSteps();
  }

  /* ================= GRAPH REPRESENTATION ================= */
  List<VisualStep> _representationSteps() {
    final nodes = ['A', 'B', 'C', 'D'];

    return [
      VisualStep(
        state: nodes,
        highlight: ['A'],
        explanation: 'Graph consists of nodes (vertices)',
      ),
      VisualStep(
        state: nodes,
        highlight: ['A', 'B'],
        explanation: 'Edges connect nodes',
      ),
    ];
  }

  /* ================= BFS ================= */
  List<VisualStep> _bfsSteps() {
    final order = ['A', 'B', 'C', 'D'];
    final steps = <VisualStep>[];

    for (int i = 0; i < order.length; i++) {
      steps.add(
        VisualStep(
          state: order,
          highlight: [order[i]],
          explanation: 'Visited ${order[i]} using BFS',
        ),
      );
    }
    return steps;
  }

  /* ================= DFS ================= */
  List<VisualStep> _dfsSteps() {
    final order = ['A', 'B', 'D', 'C'];
    final steps = <VisualStep>[];

    for (int i = 0; i < order.length; i++) {
      steps.add(
        VisualStep(
          state: order,
          highlight: [order[i]],
          explanation: 'Visited ${order[i]} using DFS',
        ),
      );
    }
    return steps;
  }

  /* ================= CYCLE DETECTION ================= */
  List<VisualStep> _cycleDetectionSteps() {
    final nodes = ['A', 'B', 'C'];

    return [
      VisualStep(
        state: nodes,
        highlight: ['A'],
        explanation: 'Start traversal from node A',
      ),
      VisualStep(
        state: nodes,
        highlight: ['B'],
        explanation: 'Move to adjacent node B',
      ),
      VisualStep(
        state: nodes,
        highlight: ['A'],
        explanation: 'Encounter visited node again → cycle detected',
      ),
    ];
  }

  /* ================= MINIMUM SPANNING TREE ================= */
  List<VisualStep> _mstSteps() {
    final nodes = ['A', 'B', 'C', 'D'];

    return [
      VisualStep(
        state: nodes,
        highlight: ['A', 'B'],
        explanation: 'Pick minimum weight edge A-B',
      ),
      VisualStep(
        state: nodes,
        highlight: ['B', 'C'],
        explanation: 'Add next minimum edge B-C',
      ),
      VisualStep(
        state: nodes,
        highlight: ['C', 'D'],
        explanation: 'Spanning tree completed',
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
