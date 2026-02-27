import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../widgets/app_drawer.dart';

class _PlacementNote {
  final String topic;
  final String emoji;
  final Color color;
  final List<String> bullets;

  const _PlacementNote({
    required this.topic,
    required this.emoji,
    required this.color,
    required this.bullets,
  });
}

final List<_PlacementNote> _notes = [
  _PlacementNote(
    topic: 'Arrays',
    emoji: '📦',
    color: Colors.blueAccent,
    bullets: [
      'Index from 0. Access in O(1), search O(n).',
      'Use two pointers for pair problems on sorted arrays.',
      'Sliding window for subarray with given property.',
      'Prefix sum for range sum queries.',
      'Kadane\'s Algorithm: max subarray sum in O(n).',
      'Dutch Flag: 3-way partition for 0s, 1s, 2s.',
      'Rotate array: reverse subarrays in O(n).',
      'Binary search on sorted array: O(log n).',
    ],
  ),
  _PlacementNote(
    topic: 'Strings',
    emoji: '🔤',
    color: Colors.purpleAccent,
    bullets: [
      'Immutable in Java — StringBuilder for modifications.',
      'Check palindrome: two pointers from both ends.',
      'Anagram check: sort both or use frequency map.',
      'Sliding window for longest substring without repeat.',
      'KMP algorithm for pattern matching: O(n+m).',
      'Rabin-Karp uses rolling hash for pattern search.',
      'String reversal: split, reverse words, join.',
      'char[] vs String for mutability.',
    ],
  ),
  _PlacementNote(
    topic: 'Sliding Window',
    emoji: '🪟',
    color: Colors.tealAccent,
    bullets: [
      'Fixed size window: sum/product of window of size k.',
      'Variable size window: shrink left when condition breaks.',
      'Track window state using HashSet/HashMap/counter.',
      'Longest substring with at most k distinct chars.',
      'Minimum window substring: expand right, shrink left.',
      'Max sum subarray of size k: O(n) instead of O(n²).',
      'Always maintain a "valid window" invariant.',
    ],
  ),
  _PlacementNote(
    topic: 'Two Pointers',
    emoji: '👉👉',
    color: Colors.orangeAccent,
    bullets: [
      'Works best on sorted arrays.',
      'Two-sum on sorted: one pointer at each end.',
      'Remove duplicates: slow pointer tracks unique elements.',
      'Partition: left pointer for ≤ pivot, right for > pivot.',
      'Floyd\'s cycle detection: slow+fast pointers.',
      'Three-sum: fix one, apply two-pointer on rest.',
      'Container with most water: greedy two pointers.',
      'Merge two sorted arrays using two pointers.',
    ],
  ),
  _PlacementNote(
    topic: 'Binary Search',
    emoji: '🔍',
    color: Colors.greenAccent,
    bullets: [
      'Prerequisite: sorted array.',
      'lo=0, hi=n-1, mid=(lo+hi)/2.',
      'Avoid overflow: mid = lo + (hi-lo)/2.',
      'Find first/last occurrence: don\'t stop at first match.',
      'Search in rotated sorted array: check which half is sorted.',
      'Binary search on answer: minimize/maximize result.',
      'Infinite array search: double hi until target range found.',
      'Peak element: check left/right neighbor to decide direction.',
    ],
  ),
  _PlacementNote(
    topic: 'Trees',
    emoji: '🌳',
    color: Colors.green,
    bullets: [
      'Inorder (L→N→R) of BST = sorted.',
      'Preorder: useful for tree serialization.',
      'Postorder: bottom-up — used for deletion, subtree problems.',
      'Level order: BFS using a Queue.',
      'Height of tree: max(left, right) + 1.',
      'BST: left < root < right.',
      'LCA in BST: path diverges at LCA.',
      'Diameter = longest path through root (left height + right height).',
      'Check balanced: |left_height - right_height| ≤ 1 at every node.',
    ],
  ),
  _PlacementNote(
    topic: 'Graphs',
    emoji: '🕸️',
    color: Colors.orangeAccent,
    bullets: [
      'Represent as adjacency list (sparse) or matrix (dense).',
      'BFS: shortest path in unweighted graph, uses Queue.',
      'DFS: cycle detection, topological sort, uses Stack/Recursion.',
      'Dijkstra: shortest path with non-negative weights, uses Min-Heap.',
      'Bellman-Ford: handles negative weights, V-1 relaxations.',
      'Topological sort: in-degree based (Kahn\'s) or DFS-based.',
      'Union-Find (DSU): detect cycle, connected components.',
      'MST: Prim\'s (greedy) or Kruskal\'s (sort edges).',
      'Bipartite check: 2-color with BFS/DFS.',
    ],
  ),
  _PlacementNote(
    topic: 'Dynamic Programming',
    emoji: '📊',
    color: Colors.pinkAccent,
    bullets: [
      'DP = Recursion + Memoization (top-down) or Tabulation (bottom-up).',
      'Identify subproblem: what depends on what?',
      'State: what parameters uniquely define a subproblem.',
      'Fibonacci: classic DP — O(2ⁿ) → O(n) with memo.',
      '0/1 Knapsack: dp[i][w] = max(skip, take).',
      'LCS: dp[i][j] = match or max(dp[i-1][j], dp[i][j-1]).',
      'LIS: O(n²) DP or O(n log n) with patience sorting.',
      'Matrix Chain: dp[i][j] = min cost to multiply matrices i to j.',
      'Coin change: unbounded knapsack variant.',
      'DP on strings: edit distance, LCS, palindrome substrings.',
    ],
  ),
  _PlacementNote(
    topic: 'Greedy',
    emoji: '💰',
    color: Colors.amberAccent,
    bullets: [
      'Make locally optimal choice at each step.',
      'Greedy works when: optimal substructure + greedy choice property.',
      'Activity Selection: sort by end time, pick non-overlapping.',
      'Fractional Knapsack: sort by value/weight ratio.',
      'Huffman Coding: always merge 2 lowest-frequency nodes.',
      'Coin change greedy works only for canonical coin systems.',
      'Job Scheduling: sort by deadline or profit.',
      'Interval problems often solved greedily with sorting.',
    ],
  ),
  _PlacementNote(
    topic: 'Backtracking',
    emoji: '🔙',
    color: Colors.redAccent,
    bullets: [
      'Try all possibilities, undo when stuck ("backtrack").',
      'Template: choose → explore → unchoose.',
      'N-Queens: place queens row by row, check constraints.',
      'Permutations: swap current with all remaining positions.',
      'Combinations: pick subsets of size k from n elements.',
      'Sudoku: fill cell, recurse, remove if invalid.',
      'Prune early to avoid invalid branches.',
      'Time is exponential O(n!) in worst case.',
    ],
  ),
];

class PlacementNotesScreen extends StatelessWidget {
  const PlacementNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.placementNotes),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Placement Notes',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color:
                    (isDark ? AppColors.warning : AppColors.warning).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.warning.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.rocket_launch_rounded,
                      color: AppColors.warning, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Last-minute prep notes. Short, sharp, interview-ready! 🚀',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.warning,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notes.length,
              itemBuilder: (context, i) {
                return _NoteCard(note: _notes[i])
                    .animate(delay: (i * 60).ms)
                    .fadeIn()
                    .slideY(begin: 0.1, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteCard extends StatefulWidget {
  final _PlacementNote note;

  const _NoteCard({required this.note});

  @override
  State<_NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<_NoteCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final n = widget.note;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: n.color.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(n.emoji, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      n.topic,
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: n.color,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_more_rounded,
                        color: textSub, size: 22),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: n.bullets
                    .map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: n.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  b,
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: textMain,
                                      height: 1.5),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
