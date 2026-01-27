import 'package:flutter/material.dart';
import 'graph_node.dart';
import 'graph_edge_painter.dart';

class GraphVisualizer extends StatefulWidget {
  final String subtopic;

  const GraphVisualizer({super.key, required this.subtopic});

  @override
  State<GraphVisualizer> createState() => _GraphVisualizerState();
}

class _GraphVisualizerState extends State<GraphVisualizer> {
  final Map<String, Offset> positions = {
    'A': const Offset(140, 40),
    'B': const Offset(40, 120),
    'C': const Offset(240, 120),
    'D': const Offset(80, 220),
    'E': const Offset(200, 220),
  };

  final Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['D'],
    'C': ['E'],
    'D': [],
    'E': [],
  };

  Set<String> visited = {};
  String? activeNode;
  String caption = 'Graph consists of nodes and edges';
  bool playing = false;

  Future<void> play() async {
    if (playing) return;
    playing = true;

    if (widget.subtopic.contains('DFS')) {
      await _dfs('A');
    } else {
      await _bfs();
    }

    setState(() {
      activeNode = null;
      caption = 'Traversal completed';
    });

    playing = false;
  }

  Future<void> _bfs() async {
    setState(() => caption = 'BFS explores level by level');

    final queue = <String>['A'];

    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);

      if (visited.contains(node)) continue;

      setState(() => activeNode = node);
      await Future.delayed(const Duration(milliseconds: 700));

      setState(() {
        visited.add(node);
        caption = 'Visited $node';
      });

      queue.addAll(graph[node]!);
      await Future.delayed(const Duration(milliseconds: 600));
    }
  }

  Future<void> _dfs(String node) async {
    if (visited.contains(node)) return;

    setState(() {
      activeNode = node;
      caption = 'Visiting $node';
    });

    await Future.delayed(const Duration(milliseconds: 700));
    visited.add(node);

    for (final next in graph[node]!) {
      await _dfs(next);
    }
  }

  void reset() {
    setState(() {
      visited.clear();
      activeNode = null;
      caption = 'Graph consists of nodes and edges';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// GRAPH AREA
        SizedBox(
          width: 300,
          height: 280,
          child: Stack(
            children: [
              /// EDGES
              ...graph.entries.expand((e) {
                return e.value.map((to) {
                  return CustomPaint(
                    painter: GraphEdgePainter(
                      positions[e.key]!,
                      positions[to]!,
                    ),
                  );
                });
              }),

              /// NODES
              ...positions.entries.map((e) {
                return Positioned(
                  left: e.value.dx,
                  top: e.value.dy,
                  child: GraphNode(
                    label: e.key,
                    active: activeNode == e.key,
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
