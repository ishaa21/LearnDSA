import 'package:flutter/material.dart';

// VISUALIZERS
import 'array/array_visualizer.dart';
import 'sorting/sorting_visualizer.dart';
import 'stack/stack_visualizer.dart';
import 'queue/queue_visualizer.dart';
import 'linked_list/linked_list_visualizer.dart';
import 'graph/graph_visualizer.dart';
import 'tree/tree_visualizer.dart';
import 'searching/searching_visualizer.dart';

import 'empty_visualizer.dart';

class VisualizerFactory {
  static Widget get({
    required String topic,
    required String subtopic,
  }) {
    /* ================= SORTING ================= */
    if (topic == 'SortingAlgorithms' || topic == 'Sorting Algorithms') {
      return SortingVisualizer(subtopic: subtopic);
    }

    /* ================= ARRAY ================= */
    if (topic == 'Arrays') {
      return ArrayVisualizer(subtopic: subtopic);
    }

    /* ================= STACK ================= */
    if (topic == 'Stack') {
      return StackVisualizer(subtopic: subtopic);
    }

    /* ================= QUEUE ================= */
    if (topic == 'Queue') {
      return QueueVisualizer(subtopic: subtopic);
    }

    /* ================= LINKED LIST ================= */
    if (topic.contains('Linked')) {
      return LinkedListVisualizer(subtopic: subtopic);
    }

    /* ================= GRAPH ================= */
    if (topic == 'Graph') {
      return GraphVisualizer(subtopic: subtopic);
    }

    /* ================= TREE ================= */
    /* ================= TREE ================= */
    if (topic == 'Tree' && subtopic.contains('Traversal')) {
      return TreeVisualizer(subtopic: subtopic);
    }
    
    /* ================= SEARCHING ================= */
    if (topic == 'SearchingAlgorithms') {
      return SearchingVisualizer(subtopic: subtopic);
    }

    /* ================= FALLBACK ================= */
    return const EmptyVisualizer();
  }
}
