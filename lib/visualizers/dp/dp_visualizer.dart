import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class DpVisualizer extends StatefulWidget {
  final String subtopic;
  const DpVisualizer({super.key, required this.subtopic});

  @override
  State<DpVisualizer> createState() => _DpVisualizerState();
}

class _DpVisualizerState extends State<DpVisualizer> {
  // For Fibonacci DP visualization
  List<int?> dpTable = [];
  int targetN = 8;
  bool playing = false;
  int currentIdx = -1;
  String caption = 'Watch how DP fills the table step by step';

  @override
  void initState() {
    super.initState();
    dpTable = List.filled(targetN + 1, null);
  }

  Future<void> _playFibonacci() async {
    if (playing) return;
    playing = true;
    dpTable = List.filled(targetN + 1, null);
    
    setState(() { dpTable[0] = 0; currentIdx = 0; caption = 'Base case: dp[0] = 0'; });
    await Future.delayed(const Duration(milliseconds: 600));
    
    setState(() { dpTable[1] = 1; currentIdx = 1; caption = 'Base case: dp[1] = 1'; });
    await Future.delayed(const Duration(milliseconds: 600));

    for (int i = 2; i <= targetN; i++) {
      if (!mounted) return;
      setState(() {
        currentIdx = i;
        caption = 'dp[$i] = dp[${i - 1}] + dp[${i - 2}] = ${dpTable[i - 1]! + dpTable[i - 2]!}';
        dpTable[i] = dpTable[i - 1]! + dpTable[i - 2]!;
      });
      await Future.delayed(const Duration(milliseconds: 700));
    }
    
    setState(() { currentIdx = -1; caption = 'Complete! Fibonacci($targetN) = ${dpTable[targetN]}'; });
    playing = false;
  }

  Future<void> _playKnapsack() async {
    if (playing) return;
    playing = true;
    
    // Simple knapsack example
    final weights = [1, 2, 3];
    final values = [6, 10, 12];
    final capacity = 5;
    final n = weights.length;
    final dp = List.generate(n + 1, (_) => List.filled(capacity + 1, 0));

    for (int i = 1; i <= n; i++) {
      for (int w = 0; w <= capacity; w++) {
        if (!mounted) return;
        dp[i][w] = dp[i - 1][w];
        if (weights[i - 1] <= w) {
          dp[i][w] = dp[i][w] > dp[i - 1][w - weights[i - 1]] + values[i - 1]
              ? dp[i][w] : dp[i - 1][w - weights[i - 1]] + values[i - 1];
        }
        setState(() {
          caption = 'Item ${i}: weight=${weights[i - 1]}, value=${values[i - 1]}, w=$w → dp[$i][$w]=${dp[i][w]}';
        });
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }

    setState(() { caption = 'Max value = ${dp[n][capacity]} with capacity $capacity'; });
    playing = false;
  }

  void _reset() {
    setState(() {
      dpTable = List.filled(targetN + 1, null);
      currentIdx = -1;
      caption = 'Reset. Press Play to start.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFib = widget.subtopic.contains('Fibonacci') || widget.subtopic.contains('Memo') || widget.subtopic.contains('Tabulation');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(isFib ? 'Fibonacci DP Visualization' : 'DP Table Visualization',
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        const SizedBox(height: 16),

        if (isFib) ...[
          // DP Table for Fibonacci
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(targetN + 1, (i) {
                final isCurrent = currentIdx == i;
                final isFilled = dpTable[i] != null;
                return Column(children: [
                  Text('$i', style: GoogleFonts.firaCode(fontSize: 11, color: AppColors.textSub)),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 44, height: 44,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: isCurrent ? AppColors.warning : isFilled ? AppColors.success.withOpacity(0.15) : AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: isCurrent ? AppColors.warning : isFilled ? AppColors.success : AppColors.textSub.withOpacity(0.2)),
                    ),
                    child: Center(child: Text(
                      isFilled ? '${dpTable[i]}' : '?',
                      style: GoogleFonts.firaCode(fontWeight: FontWeight.bold, fontSize: 13,
                          color: isCurrent ? Colors.white : isFilled ? AppColors.success : AppColors.textSub),
                    )),
                  ),
                ]);
              }),
            ),
          ),
          const SizedBox(height: 8),
          Text('dp[i] = dp[i-1] + dp[i-2]', style: GoogleFonts.firaCode(color: AppColors.accent, fontSize: 13)),
        ],

        const SizedBox(height: 16),
        Text(caption, style: GoogleFonts.inter(color: AppColors.textSub, fontSize: 14), textAlign: TextAlign.center),
        const SizedBox(height: 16),

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: isFib ? _playFibonacci : _playKnapsack, child: const Text('Play')),
          const SizedBox(width: 12),
          OutlinedButton(onPressed: _reset, child: const Text('Reset')),
        ]),
      ]),
    );
  }
}
