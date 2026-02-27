import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';

class _Flashcard {
  final String question;
  final String answer;
  final String category;

  const _Flashcard(
      {required this.question,
      required this.answer,
      required this.category});
}

final List<_Flashcard> _cards = [
  _Flashcard(question: 'Time complexity of accessing an array element?', answer: 'O(1) — Direct index access.', category: 'Arrays'),
  _Flashcard(question: 'Time complexity of Binary Search?', answer: 'O(log n) — Halves search space each time.', category: 'Search'),
  _Flashcard(question: 'Worst case of Quick Sort?', answer: 'O(n²) — Happens with bad pivot (min/max always picked).', category: 'Sorting'),
  _Flashcard(question: 'Space complexity of Merge Sort?', answer: 'O(n) — Needs auxiliary array for merging.', category: 'Sorting'),
  _Flashcard(question: 'Time complexity of BFS / DFS on a graph?', answer: 'O(V + E) where V = vertices, E = edges.', category: 'Graph'),
  _Flashcard(question: 'Stack push/pop time complexity?', answer: 'O(1) — Always operates on the top.', category: 'Stack'),
  _Flashcard(question: 'HashMap average lookup time?', answer: 'O(1) average, O(n) worst case (all collisions).', category: 'Hashing'),
  _Flashcard(question: 'Height of a balanced binary tree with n nodes?', answer: 'O(log n)', category: 'Trees'),
  _Flashcard(question: 'Time complexity of building a heap from n elements?', answer: 'O(n) — Floyd\'s heapify is linear.', category: 'Heap'),
  _Flashcard(question: 'Time complexity to extract min from a Min Heap?', answer: 'O(log n) — Must heapify down after removal.', category: 'Heap'),
  _Flashcard(question: 'Time complexity of Dijkstra with a min-heap?', answer: 'O((V + E) log V)', category: 'Graph'),
  _Flashcard(question: 'Space complexity of recursive DFS on a tree?', answer: 'O(h) where h = height. Worst case O(n) for skewed tree.', category: 'Trees'),
  _Flashcard(question: 'Time complexity of generating all permutations of n elements?', answer: 'O(n × n!) — n! permutations, each takes O(n).', category: 'Backtracking'),
  _Flashcard(question: 'Sliding window time complexity?', answer: 'O(n) — Each element enters and exits the window once.', category: 'Sliding Window'),
  _Flashcard(question: '0/1 Knapsack time and space complexity?', answer: 'Time: O(n×W), Space: O(n×W) or O(W) optimized.', category: 'DP'),
  _Flashcard(question: 'LCS of two strings of length m and n?', answer: 'O(m×n) time, O(m×n) space.', category: 'DP'),
  _Flashcard(question: 'Insertion in a Linked List at head?', answer: 'O(1) — Just update head pointer.', category: 'Linked List'),
  _Flashcard(question: 'Time to find middle of a linked list?', answer: 'O(n) — Use slow+fast pointer technique.', category: 'Linked List'),
  _Flashcard(question: 'Space complexity of BFS on a graph?', answer: 'O(V) — Queue holds at most V nodes.', category: 'Graph'),
  _Flashcard(question: 'Time complexity of Bubble Sort best case?', answer: 'O(n) — Already sorted, no swaps needed (with optimization).', category: 'Sorting'),
];

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Set<int> _flipped = {};

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text('Complexity Flashcards',
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold, color: textMain)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${_cards.length}',
                style: GoogleFonts.outfit(
                    color: textSub, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: (_currentIndex + 1) / _cards.length,
            minHeight: 3,
            backgroundColor: (isDark ? AppColors.surface : AppColors.lightSurface),
            valueColor: AlwaysStoppedAnimation<Color>(
                isDark ? AppColors.accent : AppColors.lightAccent),
          ),

          // Hint
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '👆 Tap card to reveal answer  •  Swipe to navigate',
              style: GoogleFonts.inter(fontSize: 12, color: textSub),
            ),
          ),

          // Cards
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _cards.length,
              onPageChanged: (i) => setState(() {
                _currentIndex = i;
              }),
              itemBuilder: (context, index) {
                return _FlashCard(
                  card: _cards[index],
                  isFlipped: _flipped.contains(index),
                  onTap: () => setState(() {
                    _flipped.contains(index)
                        ? _flipped.remove(index)
                        : _flipped.add(index);
                  }),
                  isDark: isDark,
                );
              },
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBtn(
                  icon: Icons.arrow_back_rounded,
                  label: 'Prev',
                  onTap: _currentIndex > 0
                      ? () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut)
                      : null,
                  isDark: isDark,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _flipped.contains(_currentIndex)
                        ? _flipped.remove(_currentIndex)
                        : _flipped.add(_currentIndex);
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: (isDark ? AppColors.accent : AppColors.lightAccent)
                          .withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: isDark
                              ? AppColors.accent
                              : AppColors.lightAccent),
                    ),
                    child: Text(
                      _flipped.contains(_currentIndex)
                          ? 'Show Question'
                          : 'Reveal Answer',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.accent
                              : AppColors.lightAccent),
                    ),
                  ),
                ),
                _NavBtn(
                  icon: Icons.arrow_forward_rounded,
                  label: 'Next',
                  onTap: _currentIndex < _cards.length - 1
                      ? () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut)
                      : null,
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FlashCard extends StatelessWidget {
  final _Flashcard card;
  final bool isFlipped;
  final VoidCallback onTap;
  final bool isDark;

  const _FlashCard({
    required this.card,
    required this.isFlipped,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardBg = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isFlipped
              ? Container(
                  key: const ValueKey('answer'),
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.success.withOpacity(0.8),
                        AppColors.success,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.success.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '✅ Answer',
                          style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        card.answer,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        card.category,
                        style: GoogleFonts.inter(
                            fontSize: 13, color: Colors.white70),
                      ),
                    ],
                  ),
                )
              : Container(
                  key: const ValueKey('question'),
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(28),
                    border:
                        Border.all(color: accentColor.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          card.category,
                          style: GoogleFonts.outfit(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        '❓',
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        card.question,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: textMain,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Tap to reveal answer',
                        style: GoogleFonts.inter(
                            fontSize: 13, color: textSub),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDark;

  const _NavBtn({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final color = onTap == null
        ? (isDark ? AppColors.textSub : AppColors.lightTextSub).withOpacity(0.3)
        : (isDark ? AppColors.textSub : AppColors.lightTextSub);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          Text(label,
              style: GoogleFonts.inter(fontSize: 11, color: color)),
        ],
      ),
    );
  }
}
