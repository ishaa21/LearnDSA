import 'package:flutter/material.dart';
import 'tree_node.dart';
import 'tree_edge_painter.dart';

class TreeVisualizer extends StatefulWidget {
  final String subtopic;

  const TreeVisualizer({super.key, required this.subtopic});

  @override
  State<TreeVisualizer> createState() => _TreeVisualizerState();
}

class _TreeVisualizerState extends State<TreeVisualizer> {
  final Map<int, Offset> positions = {
    1: const Offset(130, 20),
    2: const Offset(60, 90),
    3: const Offset(200, 90),
    4: const Offset(30, 170),
    5: const Offset(90, 170),
    6: const Offset(170, 170),
    7: const Offset(230, 170),
  };

  final Map<int, List<int>> tree = {
    1: [2, 3],
    2: [4, 5],
    3: [6, 7],
    4: [],
    5: [],
    6: [],
    7: [],
  };

  Set<int> visited = {};
  int? active;
  String caption = 'Tree traversal visits nodes in a specific order';
  bool playing = false;

  Future<void> play() async {
    if (playing) return;
    playing = true;

    visited.clear();

    if (widget.subtopic.contains('Preorder')) {
      await _preorder(1);
    } else if (widget.subtopic.contains('Postorder')) {
      await _postorder(1);
    } else if (widget.subtopic.contains('Level')) {
      await _levelOrder();
    } else {
      await _inorder(1);
    }

    setState(() {
      active = null;
      caption = 'Traversal completed';
    });

    playing = false;
  }

  Future<void> _visit(int node) async {
    setState(() {
      active = node;
      caption = 'Visiting node $node';
    });
    await Future.delayed(const Duration(milliseconds: 700));
    visited.add(node);
  }

  Future<void> _inorder(int node) async {
    if (visited.contains(node)) return;
    final children = tree[node]!;
    if (children.isNotEmpty) await _inorder(children[0]);
    await _visit(node);
    if (children.length > 1) await _inorder(children[1]);
  }

  Future<void> _preorder(int node) async {
    if (visited.contains(node)) return;
    await _visit(node);
    for (final c in tree[node]!) {
      await _preorder(c);
    }
  }

  Future<void> _postorder(int node) async {
    if (visited.contains(node)) return;
    for (final c in tree[node]!) {
      await _postorder(c);
    }
    await _visit(node);
  }

  Future<void> _levelOrder() async {
    setState(() => caption = 'Level order traversal (BFS)');
    final queue = <int>[1];

    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      await _visit(node);
      queue.addAll(tree[node]!);
    }
  }

  void reset() {
    setState(() {
      visited.clear();
      active = null;
      caption = 'Tree traversal visits nodes in a specific order';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// TREE AREA
        SizedBox(
          width: 300,
          height: 230,
          child: Stack(
            children: [
              /// EDGES
              ...tree.entries.expand((e) {
                return e.value.map((c) {
                  return CustomPaint(
                    painter: TreeEdgePainter(
                      positions[e.key]!,
                      positions[c]!,
                    ),
                  );
                });
              }),

              /// NODES
              ...positions.entries.map((e) {
                return Positioned(
                  left: e.value.dx,
                  top: e.value.dy,
                  child: TreeNodeWidget(
                    value: e.key,
                    active: active == e.key,
                    visited: visited.contains(e.key),
                  ),
                );
              }),
            ],
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
              onPressed: play,
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
