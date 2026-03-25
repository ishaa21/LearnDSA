import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class HashingVisualizer extends StatefulWidget {
  final String subtopic;
  const HashingVisualizer({super.key, required this.subtopic});

  @override
  State<HashingVisualizer> createState() => _HashingVisualizerState();
}

class _HashingVisualizerState extends State<HashingVisualizer> {
  final int tableSize = 7;
  late List<List<int>> table;
  final TextEditingController _controller = TextEditingController();
  String caption = 'Enter a key to insert into the hash table';
  int? highlightBucket;
  int? highlightItem;

  @override
  void initState() {
    super.initState();
    table = List.generate(tableSize, (_) => []);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _insert() {
    final val = int.tryParse(_controller.text);
    if (val == null) return;
    final bucket = val % tableSize;
    setState(() {
      table[bucket].add(val);
      highlightBucket = bucket;
      highlightItem = table[bucket].length - 1;
      caption = 'h($val) = $val % $tableSize = $bucket → Inserted at bucket $bucket';
    });
    _controller.clear();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() { highlightBucket = null; highlightItem = null; });
    });
  }

  void _search() {
    final val = int.tryParse(_controller.text);
    if (val == null) return;
    final bucket = val % tableSize;
    final idx = table[bucket].indexOf(val);
    setState(() {
      highlightBucket = bucket;
      if (idx != -1) {
        highlightItem = idx;
        caption = 'h($val) = $bucket → Found at bucket $bucket, position $idx ✓';
      } else {
        highlightItem = null;
        caption = 'h($val) = $bucket → Not found in bucket $bucket ✗';
      }
    });
    _controller.clear();
  }

  void _reset() {
    setState(() {
      table = List.generate(tableSize, (_) => []);
      caption = 'Hash table cleared';
      highlightBucket = null;
      highlightItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.firaCode(color: AppColors.textMain),
                  decoration: InputDecoration(
                    hintText: 'Enter a number',
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(onPressed: _insert, child: const Text('Insert')),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: _search, child: const Text('Search')),
            ],
          ),
          const SizedBox(height: 16),
          
          // Hash Table Visualization
          ...List.generate(tableSize, (i) {
            final isHighlighted = highlightBucket == i;
            return Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  // Bucket index
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: isHighlighted ? AppColors.accent : AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text('$i', style: GoogleFonts.firaCode(fontWeight: FontWeight.bold, color: isHighlighted ? Colors.white : AppColors.textMain))),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16, color: AppColors.textSub),
                  const SizedBox(width: 8),
                  // Chain
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: table[i].isEmpty
                            ? [Text('null', style: GoogleFonts.firaCode(color: AppColors.textSub, fontSize: 12))]
                            : table[i].asMap().entries.map((e) {
                                final isItemHighlighted = isHighlighted && highlightItem == e.key;
                                return Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: isItemHighlighted ? AppColors.success : AppColors.card,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: isItemHighlighted ? AppColors.success : AppColors.textSub.withOpacity(0.2)),
                                      ),
                                      child: Text('${e.value}', style: GoogleFonts.firaCode(fontWeight: FontWeight.bold, color: isItemHighlighted ? Colors.white : AppColors.textMain)),
                                    ),
                                    if (e.key < table[i].length - 1)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Icon(Icons.arrow_forward, size: 14, color: AppColors.textSub),
                                      ),
                                  ],
                                );
                              }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          
          // Formula display
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
            child: Text('h(key) = key % $tableSize', style: GoogleFonts.firaCode(color: AppColors.accent, fontSize: 14)),
          ),
          const SizedBox(height: 12),
          
          // Caption
          Text(caption, style: GoogleFonts.inter(color: AppColors.textSub, fontSize: 14), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          
          OutlinedButton.icon(onPressed: _reset, icon: const Icon(Icons.refresh), label: const Text('Reset')),
        ],
      ),
    );
  }
}
