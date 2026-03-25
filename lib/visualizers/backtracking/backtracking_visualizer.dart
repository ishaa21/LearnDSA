import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class BacktrackingVisualizer extends StatefulWidget {
  final String subtopic;
  const BacktrackingVisualizer({super.key, required this.subtopic});

  @override
  State<BacktrackingVisualizer> createState() => _BacktrackingVisualizerState();
}

class _BacktrackingVisualizerState extends State<BacktrackingVisualizer> {
  // N-Queens visualization
  int boardSize = 4;
  List<int> queens = []; // queens[row] = col
  String caption = 'Tap Play to see backtracking solve N-Queens';
  bool playing = false;
  Set<String> tried = {};

  Future<void> _play() async {
    if (playing) return;
    playing = true;
    queens.clear();
    tried.clear();
    setState(() { caption = 'Starting N-Queens backtracking for N=$boardSize...'; });
    await Future.delayed(const Duration(milliseconds: 500));
    
    await _solve(0);
    
    if (queens.length == boardSize) {
      setState(() { caption = 'Solution found! ✓ Queens at: ${queens.asMap().entries.map((e) => "(${e.key},${e.value})").join(", ")}'; });
    }
    playing = false;
  }

  Future<bool> _solve(int row) async {
    if (row == boardSize) return true;
    
    for (int col = 0; col < boardSize; col++) {
      if (!mounted) return false;
      tried.add('$row-$col');
      setState(() { caption = 'Trying queen at row $row, col $col...'; });
      await Future.delayed(const Duration(milliseconds: 300));

      if (_isSafe(row, col)) {
        setState(() { queens.add(col); caption = 'Placed queen at ($row, $col) ✓'; });
        await Future.delayed(const Duration(milliseconds: 400));

        if (await _solve(row + 1)) return true;

        // Backtrack
        setState(() {
          queens.removeLast();
          caption = 'Backtracking from row $row, col $col ✗';
        });
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
    return false;
  }

  bool _isSafe(int row, int col) {
    for (int i = 0; i < queens.length; i++) {
      if (queens[i] == col) return false; // same column
      if ((row - i).abs() == (col - queens[i]).abs()) return false; // diagonal
    }
    return true;
  }

  void _reset() {
    setState(() { queens.clear(); tried.clear(); caption = 'Press Play to start'; });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text('N-Queens Backtracking', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        const SizedBox(height: 8),
        
        // Board size selector
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Board size: ', style: GoogleFonts.inter(color: AppColors.textSub)),
          ...List.generate(3, (i) {
            final n = i + 4;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text('$n'),
                selected: boardSize == n,
                onSelected: (v) { if (!playing) setState(() { boardSize = n; queens.clear(); tried.clear(); }); },
                selectedColor: AppColors.accent,
                labelStyle: GoogleFonts.outfit(color: boardSize == n ? Colors.white : AppColors.textMain),
              ),
            );
          }),
        ]),
        const SizedBox(height: 16),

        // Board
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(border: Border.all(color: AppColors.textSub.withOpacity(0.3)), borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: List.generate(boardSize, (row) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(boardSize, (col) {
                  final isDark = (row + col) % 2 == 1;
                  final hasQueen = row < queens.length && queens[row] == col;
                  final wasTried = tried.contains('$row-$col');

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 50, height: 50,
                    decoration: BoxDecoration(
                      color: hasQueen ? AppColors.success.withOpacity(0.3)
                          : wasTried ? AppColors.error.withOpacity(0.1)
                          : isDark ? AppColors.card : AppColors.surface,
                    ),
                    child: Center(
                      child: hasQueen
                          ? const Text('♛', style: TextStyle(fontSize: 28, color: AppColors.success))
                          : null,
                    ),
                  );
                }),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        Text(caption, style: GoogleFonts.inter(color: AppColors.textSub, fontSize: 14), textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: _play, child: const Text('Play')),
          const SizedBox(width: 12),
          OutlinedButton(onPressed: _reset, child: const Text('Reset')),
        ]),
      ]),
    );
  }
}
