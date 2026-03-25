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
import 'hashing/hashing_visualizer.dart';
import 'heap/heap_visualizer.dart';
import 'dp/dp_visualizer.dart';
import 'string/string_visualizer.dart';
import 'backtracking/backtracking_visualizer.dart';

import 'empty_visualizer.dart';
import 'visual_support.dart';

class VisualizerFactory {
  static Widget get({
    required String topic,
    required String subtopic,
  }) {
    // If we don't have a specific visualization implemented for this subtopic,
    // show the "Coming Soon" empty state instead of a weird unrelated one.
    if (!hasVisualization(subtopic)) {
      return const EmptyVisualizer();
    }
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
    if (topic.contains('Linked') || topic == 'Linkedlist') {
      return LinkedListVisualizer(subtopic: subtopic);
    }

    /* ================= GRAPH ================= */
    if (topic == 'Graph') {
      return GraphVisualizer(subtopic: subtopic);
    }

    /* ================= TREE ================= */
    if (topic == 'Tree') {
      return TreeVisualizer(subtopic: subtopic);
    }
    
    /* ================= SEARCHING ================= */
    if (topic == 'SearchingAlgorithms') {
      return SearchingVisualizer(subtopic: subtopic);
    }

    /* ================= HASHING ================= */
    if (topic == 'Hashing') {
      return HashingVisualizer(subtopic: subtopic);
    }

    /* ================= HEAP ================= */
    if (topic == 'Heap') {
      return HeapVisualizer(subtopic: subtopic);
    }

    /* ================= DYNAMIC PROGRAMMING ================= */
    if (topic == 'DynamicProgramming') {
      return DpVisualizer(subtopic: subtopic);
    }

    /* ================= STRING ================= */
    if (topic == 'String' || topic == 'StringAlgorithms') {
      return StringVisualizer(subtopic: subtopic);
    }

    /* ================= BACKTRACKING ================= */
    if (topic == 'Backtracking') {
      return BacktrackingVisualizer(subtopic: subtopic);
    }

    /* ================= GREEDY ================= */
    if (topic == 'GreedyAlgo') {
      // Greedy reuses DP visualizer for table-based approach
      return DpVisualizer(subtopic: subtopic);
    }

    /* ================= FALLBACK ================= */
    return const EmptyVisualizer();
  }
}
