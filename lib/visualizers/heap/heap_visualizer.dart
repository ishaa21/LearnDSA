import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class HeapVisualizer extends StatefulWidget {
  final String subtopic;
  const HeapVisualizer({super.key, required this.subtopic});

  @override
  State<HeapVisualizer> createState() => _HeapVisualizerState();
}

class _HeapVisualizerState extends State<HeapVisualizer> {
  List<int> heap = [];
  String caption = 'Insert elements to build a heap';
  int? highlightIdx;
  final TextEditingController _controller = TextEditingController();

  bool get isMaxHeap => widget.subtopic.contains('Max') || widget.subtopic.contains('Heapify');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _insert() {
    final val = int.tryParse(_controller.text);
    if (val == null || heap.length >= 15) return;
    _controller.clear();
    setState(() {
      heap.add(val);
      caption = 'Inserted $val. Heapifying up...';
    });
    _heapifyUp(heap.length - 1);
  }

  Future<void> _heapifyUp(int idx) async {
    while (idx > 0) {
      final parent = (idx - 1) ~/ 2;
      final shouldSwap = isMaxHeap ? heap[idx] > heap[parent] : heap[idx] < heap[parent];
      if (!shouldSwap) break;
      
      setState(() {
        highlightIdx = idx;
        caption = 'Swapping ${heap[idx]} with parent ${heap[parent]}';
      });
      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        final temp = heap[idx];
        heap[idx] = heap[parent];
        heap[parent] = temp;
      });
      idx = parent;
    }
    setState(() { highlightIdx = null; caption = isMaxHeap ? 'Max Heap property satisfied ✓' : 'Min Heap property satisfied ✓'; });
  }

  void _extractRoot() async {
    if (heap.isEmpty) return;
    final root = heap[0];
    setState(() {
      caption = 'Extracting root: $root';
      highlightIdx = 0;
    });
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      if (heap.length == 1) {
        heap.clear();
      } else {
        heap[0] = heap.last;
        heap.removeLast();
      }
      highlightIdx = null;
      caption = 'Removed $root. Heapifying down...';
    });
    if (heap.isNotEmpty) await _heapifyDown(0);
  }

  Future<void> _heapifyDown(int idx) async {
    while (true) {
      int target = idx;
      final left = 2 * idx + 1;
      final right = 2 * idx + 2;

      if (left < heap.length) {
        final cmp = isMaxHeap ? heap[left] > heap[target] : heap[left] < heap[target];
        if (cmp) target = left;
      }
      if (right < heap.length) {
        final cmp = isMaxHeap ? heap[right] > heap[target] : heap[right] < heap[target];
        if (cmp) target = right;
      }
      if (target == idx) break;

      setState(() {
        highlightIdx = target;
        caption = 'Swapping ${heap[idx]} with child ${heap[target]}';
      });
      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        final temp = heap[idx];
        heap[idx] = heap[target];
        heap[target] = temp;
      });
      idx = target;
    }
    setState(() { highlightIdx = null; caption = 'Heap property restored ✓'; });
  }

  void _reset() {
    setState(() { heap.clear(); caption = 'Heap cleared'; highlightIdx = null; });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        // Title
        Text(isMaxHeap ? 'Max Heap Visualizer' : 'Min Heap Visualizer',
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        const SizedBox(height: 16),

        // Controls
        Row(children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: GoogleFonts.firaCode(color: AppColors.textMain),
              decoration: InputDecoration(hintText: 'Value', filled: true, fillColor: AppColors.surface,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: _insert, child: const Text('Insert')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: _extractRoot, child: const Text('Extract')),
        ]),
        const SizedBox(height: 20),

        // Tree visualization
        if (heap.isNotEmpty) _buildHeapTree(),
        const SizedBox(height: 12),

        // Array representation
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Text('Array: [${heap.join(", ")}]', style: GoogleFonts.firaCode(color: AppColors.textMain, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 12),
        Text(caption, style: GoogleFonts.inter(color: AppColors.textSub, fontSize: 14), textAlign: TextAlign.center),
        const SizedBox(height: 12),
        OutlinedButton.icon(onPressed: _reset, icon: const Icon(Icons.refresh), label: const Text('Reset')),
      ]),
    );
  }

  Widget _buildHeapTree() {
    // Simple tree layout using positioned widgets
    final levels = <List<int>>[];
    int idx = 0;
    int levelSize = 1;
    while (idx < heap.length) {
      final end = (idx + levelSize).clamp(0, heap.length);
      levels.add(List.generate(end - idx, (i) => idx + i));
      idx = end;
      levelSize *= 2;
    }

    return Column(
      children: levels.asMap().entries.map((levelEntry) {
        final level = levelEntry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: level.map((i) {
              final isHighlighted = highlightIdx == i;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: isHighlighted ? AppColors.warning : AppColors.card,
                  shape: BoxShape.circle,
                  border: Border.all(color: isHighlighted ? AppColors.warning : AppColors.accent, width: 2),
                ),
                child: Center(child: Text('${heap[i]}', style: GoogleFonts.firaCode(fontWeight: FontWeight.bold,
                    color: isHighlighted ? Colors.white : AppColors.textMain, fontSize: 14))),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
