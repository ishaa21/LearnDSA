import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';
import '../widgets/app_drawer.dart';

class _ComplexityEntry {
  final String name;
  final String explanation;
  final String example;
  final String codeSnippet;
  final String memoryTrick;

  const _ComplexityEntry({
    required this.name,
    required this.explanation,
    required this.example,
    required this.codeSnippet,
    required this.memoryTrick,
  });
}

class _ComplexitySection {
  final String title;
  final IconData icon;
  final Color color;
  final List<_ComplexityEntry> entries;

  const _ComplexitySection({
    required this.title,
    required this.icon,
    required this.color,
    required this.entries,
  });
}

final List<_ComplexitySection> _sections = [
  _ComplexitySection(
    title: 'Big-O Basics',
    icon: Icons.auto_graph_rounded,
    color: Colors.purpleAccent,
    entries: [
      _ComplexityEntry(
        name: 'O(1) — Constant',
        explanation:
            'The operation takes the same time regardless of input size. Doesn\'t depend on n at all.',
        example: 'Accessing array index arr[i], HashMap lookup.',
        codeSnippet: 'int x = arr[5]; // Always 1 step',
        memoryTrick: '1 = one look, done. Like finding your seat in a reserved theatre.',
      ),
      _ComplexityEntry(
        name: 'O(log n) — Logarithmic',
        explanation:
            'Each step halves the problem. Very efficient for large inputs.',
        example: 'Binary Search, Balanced BST operations.',
        codeSnippet: 'while (lo <= hi) {\n  int mid = (lo + hi) / 2;\n  if (arr[mid] == target) return mid;\n  // halve each time\n}',
        memoryTrick: 'Phone book search — you always open the middle and discard half.',
      ),
      _ComplexityEntry(
        name: 'O(n) — Linear',
        explanation:
            'Time grows proportionally with input. You visit every element once.',
        example: 'Linear search, printing all array elements.',
        codeSnippet: 'for (int i = 0; i < n; i++) print(arr[i]);',
        memoryTrick: 'Read every page of a book — more pages = more time.',
      ),
      _ComplexityEntry(
        name: 'O(n log n)',
        explanation:
            'Common in efficient sorting algorithms. Slightly worse than linear.',
        example: 'Merge Sort, Quick Sort (average), Heap Sort.',
        codeSnippet: '// Merge Sort: split in log n levels,\n// n work per level\nvoid mergeSort(arr, lo, hi) { ... }',
        memoryTrick: 'Sorting a phone book using divide & conquer.',
      ),
      _ComplexityEntry(
        name: 'O(n²) — Quadratic',
        explanation:
            'Nested loops. As n doubles, time quadruples. Slow for large n.',
        example: 'Bubble sort, Selection sort, printing pairs.',
        codeSnippet: 'for (int i=0; i<n; i++)\n  for (int j=0; j<n; j++)\n    // n*n operations',
        memoryTrick: 'Compare every student with every other student in a class.',
      ),
      _ComplexityEntry(
        name: 'O(2ⁿ) — Exponential',
        explanation:
            'Doubles with each input added. Impractical for large n.',
        example: 'Recursive Fibonacci, generating all subsets.',
        codeSnippet: 'int fib(int n) {\n  if (n<=1) return n;\n  return fib(n-1) + fib(n-2);\n}',
        memoryTrick: 'Two calls every step = exponential fern-like growth.',
      ),
    ],
  ),
  _ComplexitySection(
    title: 'Common Data Structures',
    icon: Icons.storage_rounded,
    color: Colors.blueAccent,
    entries: [
      _ComplexityEntry(
        name: 'Array',
        explanation: 'Fixed-size contiguous memory. Index-based.',
        example: 'int[] a = new int[10];',
        codeSnippet: 'Access: O(1)\nSearch: O(n)\nInsert at start: O(n)\nInsert at end: O(1)*',
        memoryTrick: 'Numbered mailboxes in a row.',
      ),
      _ComplexityEntry(
        name: 'Linked List',
        explanation: 'Chain of nodes with pointer to next node.',
        example: '1 → 2 → 3 → null',
        codeSnippet: 'Access: O(n)\nSearch: O(n)\nInsert at head: O(1)\nInsert at tail: O(n)',
        memoryTrick: 'Train wagons — to reach wagon 5, pass through 1,2,3,4.',
      ),
      _ComplexityEntry(
        name: 'Stack',
        explanation: 'LIFO — Last In First Out. Push/Pop at top only.',
        example: 'Browser back button, function call stack.',
        codeSnippet: 'Push: O(1)\nPop: O(1)\nPeek: O(1)',
        memoryTrick: 'Pile of plates — always take/put from top.',
      ),
      _ComplexityEntry(
        name: 'Queue',
        explanation: 'FIFO — First In First Out.',
        example: 'Print queue, BFS traversal.',
        codeSnippet: 'Enqueue: O(1)\nDequeue: O(1)',
        memoryTrick: 'A ticket counter line — first person gets served first.',
      ),
      _ComplexityEntry(
        name: 'HashMap',
        explanation: 'Key-value store using hashing.',
        example: 'word frequency count.',
        codeSnippet: 'Get: O(1) avg\nPut: O(1) avg\nDelete: O(1) avg\nWorst case: O(n) with collisions',
        memoryTrick: 'Dictionary — look up any word instantly.',
      ),
      _ComplexityEntry(
        name: 'Binary Heap',
        explanation: 'Complete binary tree satisfying heap property. Min/Max at root.',
        example: 'Priority Queue.',
        codeSnippet: 'Insert: O(log n)\nExtract min/max: O(log n)\nPeek: O(1)\nBuild: O(n)',
        memoryTrick: 'VIP queue — highest priority always goes first.',
      ),
    ],
  ),
  _ComplexitySection(
    title: 'Sorting Algorithms',
    icon: Icons.sort_rounded,
    color: Colors.greenAccent,
    entries: [
      _ComplexityEntry(
        name: 'Bubble Sort',
        explanation: 'Compare adjacent pairs, bubble largest to end. Repeat.',
        example: '[5,3,1] → [3,1,5] → [1,3,5]',
        codeSnippet: 'Best: O(n) — already sorted\nAverage: O(n²)\nWorst: O(n²)\nSpace: O(1)',
        memoryTrick: 'Bubbles rise to the top — largest floats to end each pass.',
      ),
      _ComplexityEntry(
        name: 'Selection Sort',
        explanation: 'Find minimum, swap to front. Repeat for remaining.',
        example: 'Select min from unsorted, place at start.',
        codeSnippet: 'Best: O(n²)\nAverage: O(n²)\nWorst: O(n²)\nSpace: O(1)',
        memoryTrick: 'Always pick the shortest person from the line.',
      ),
      _ComplexityEntry(
        name: 'Insertion Sort',
        explanation: 'Build sorted array one item at a time by inserting.',
        example: 'Like sorting playing cards in hand.',
        codeSnippet: 'Best: O(n) — nearly sorted\nAverage: O(n²)\nWorst: O(n²)\nSpace: O(1)',
        memoryTrick: 'Sorting cards as you pick them up.',
      ),
      _ComplexityEntry(
        name: 'Merge Sort',
        explanation: 'Divide into halves, sort each, merge back.',
        example: 'Divide until 1 element, merge sorted halves.',
        codeSnippet: 'Best/Average/Worst: O(n log n)\nSpace: O(n) — needs extra array',
        memoryTrick: 'Split the deck, sort halves separately, then merge.',
      ),
      _ComplexityEntry(
        name: 'Quick Sort',
        explanation: 'Choose pivot, partition around it, recurse.',
        example: 'Pivot=mid, left < pivot, right > pivot.',
        codeSnippet: 'Best/Average: O(n log n)\nWorst: O(n²) — bad pivot\nSpace: O(log n)',
        memoryTrick: 'Quarterback picks a number, everyone smaller goes left.',
      ),
      _ComplexityEntry(
        name: 'Heap Sort',
        explanation: 'Build max heap, repeatedly extract max.',
        example: 'Use priority queue to sort.',
        codeSnippet: 'Best/Average/Worst: O(n log n)\nSpace: O(1) — in-place',
        memoryTrick: 'Always take the tallest from the heap.',
      ),
    ],
  ),
  _ComplexitySection(
    title: 'Graph Algorithms',
    icon: Icons.hub_rounded,
    color: Colors.orangeAccent,
    entries: [
      _ComplexityEntry(
        name: 'BFS — Breadth First Search',
        explanation: 'Level-by-level traversal using a Queue.',
        example: 'Shortest path in unweighted graph.',
        codeSnippet: 'Time: O(V + E)\nSpace: O(V)\nV = vertices, E = edges',
        memoryTrick: 'Throw a stone in water — ripples spread level by level.',
      ),
      _ComplexityEntry(
        name: 'DFS — Depth First Search',
        explanation: 'Go as deep as possible using Stack/Recursion.',
        example: 'Cycle detection, topological sort.',
        codeSnippet: 'Time: O(V + E)\nSpace: O(V)\n(recursion stack)',
        memoryTrick: 'Go as far as possible before backtracking.',
      ),
      _ComplexityEntry(
        name: 'Dijkstra\'s Algorithm',
        explanation: 'Shortest path in weighted graph (no negative weights).',
        example: 'GPS navigation.',
        codeSnippet: 'With min-heap:\nTime: O((V + E) log V)\nSpace: O(V)',
        memoryTrick: 'Always relax the nearest unvisited node.',
      ),
      _ComplexityEntry(
        name: 'Bellman-Ford',
        explanation: 'Shortest path with negative weights. V-1 relaxations.',
        example: 'Financial arbitrage detection.',
        codeSnippet: 'Time: O(V × E)\nSpace: O(V)',
        memoryTrick: 'Relax all edges V-1 times to guarantee shortest path.',
      ),
    ],
  ),
  _ComplexitySection(
    title: 'Recursion & DP',
    icon: Icons.recycling_rounded,
    color: Colors.pinkAccent,
    entries: [
      _ComplexityEntry(
        name: 'Fibonacci (Naive)',
        explanation: 'Recursive without memoization — recalculates same values.',
        example: 'fib(5) → fib(4)+fib(3) → ...',
        codeSnippet: 'Time: O(2ⁿ)\nSpace: O(n) — call stack',
        memoryTrick: 'Branching tree — each call spawns 2 more.',
      ),
      _ComplexityEntry(
        name: 'Fibonacci (Memoization)',
        explanation: 'Cache results to avoid recomputation.',
        example: 'memo[n] = fib(n-1) + fib(n-2)',
        codeSnippet: 'Time: O(n)\nSpace: O(n) — cache + stack',
        memoryTrick: 'Remember what you calculated — check the notepad first.',
      ),
      _ComplexityEntry(
        name: '0/1 Knapsack',
        explanation: 'Take or skip each item. DP table of size n × W.',
        example: 'Max value within weight capacity.',
        codeSnippet: 'Time: O(n × W)\nSpace: O(n × W)\nOptimized space: O(W)',
        memoryTrick: 'For each item: take it or leave it.',
      ),
      _ComplexityEntry(
        name: 'LCS — Longest Common Subsequence',
        explanation: 'Find longest sequence common to two strings.',
        example: 'LCS("abcde","ace") = 3 ("ace")',
        codeSnippet: 'Time: O(m × n)\nSpace: O(m × n)\nm,n = string lengths',
        memoryTrick: 'Fill a 2D grid cell by cell.',
      ),
    ],
  ),
];

class TimeComplexityScreen extends StatelessWidget {
  const TimeComplexityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(activeItem: DrawerItem.timeComplexity),
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Time Complexity Guide',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _sections.length,
        itemBuilder: (context, i) {
          return _SectionCard(section: _sections[i])
              .animate(delay: (i * 80).ms)
              .fadeIn()
              .slideY(begin: 0.1, end: 0);
        },
      ),
    );
  }
}

class _SectionCard extends StatefulWidget {
  final _ComplexitySection section;

  const _SectionCard({required this.section});

  @override
  State<_SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<_SectionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final surfaceBg = isDark ? AppColors.surface : AppColors.lightSurface;
    final s = widget.section;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: s.color.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          // ── Header ──────────────────────────────────────────────────────
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: s.color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(s.icon, color: s.color, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.title,
                            style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: textMain)),
                        Text('${s.entries.length} entries',
                            style: GoogleFonts.inter(
                                fontSize: 12, color: textSub)),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_more_rounded,
                        color: textSub, size: 24),
                  ),
                ],
              ),
            ),
          ),

          // ── Entries ──────────────────────────────────────────────────────
          if (_expanded)
            Column(
              children: s.entries
                  .map((e) => _EntryCard(
                        entry: e,
                        accentColor: s.color,
                        textMain: textMain,
                        textSub: textSub,
                        surfaceBg: surfaceBg,
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final _ComplexityEntry entry;
  final Color accentColor;
  final Color textMain;
  final Color textSub;
  final Color surfaceBg;

  const _EntryCard({
    required this.entry,
    required this.accentColor,
    required this.textMain,
    required this.textSub,
    required this.surfaceBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(entry.name,
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: accentColor)),
          const SizedBox(height: 8),

          _InfoRow('📖', 'Explanation', entry.explanation, textMain, textSub),
          const SizedBox(height: 6),
          _InfoRow('💡', 'Example', entry.example, textMain, textSub),
          const SizedBox(height: 6),

          // Code snippet
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💻', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Complexity',
                        style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textSub)),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        entry.codeSnippet,
                        style: GoogleFonts.firaCode(
                            fontSize: 12, color: accentColor, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _InfoRow('🧠', 'Memory Trick', entry.memoryTrick, textMain, textSub),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String emoji;
  final String label;
  final String text;
  final Color textMain;
  final Color textSub;

  const _InfoRow(this.emoji, this.label, this.text, this.textMain, this.textSub);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$label: ',
                  style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: textSub),
                ),
                TextSpan(
                  text: text,
                  style: GoogleFonts.inter(
                      fontSize: 13, color: textMain, height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
