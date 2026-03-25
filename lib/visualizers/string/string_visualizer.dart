import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class StringVisualizer extends StatefulWidget {
  final String subtopic;
  const StringVisualizer({super.key, required this.subtopic});

  @override
  State<StringVisualizer> createState() => _StringVisualizerState();
}

class _StringVisualizerState extends State<StringVisualizer> {
  List<String> chars = [];
  String inputStr = 'HELLO';
  int? highlightIdx;
  int? highlightIdx2;
  String caption = 'Tap Play to see the operation';
  bool playing = false;
  final TextEditingController _controller = TextEditingController(text: 'HELLO');

  @override
  void initState() {
    super.initState();
    chars = inputStr.split('');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadInput() {
    setState(() {
      inputStr = _controller.text.isEmpty ? 'HELLO' : _controller.text.toUpperCase();
      chars = inputStr.split('');
      highlightIdx = null;
      highlightIdx2 = null;
    });
  }

  Future<void> _play() async {
    if (playing) return;
    playing = true;
    _loadInput();

    if (widget.subtopic.contains('Reverse')) {
      await _animateReverse();
    } else if (widget.subtopic.contains('Search') || widget.subtopic.contains('search')) {
      await _animateSearch();
    } else if (widget.subtopic.contains('Length')) {
      await _animateLength();
    } else if (widget.subtopic.contains('Remove')) {
      await _animateRemove();
    } else if (widget.subtopic.contains('Insert')) {
      await _animateInsert();
    } else if (widget.subtopic.contains('Substring') || widget.subtopic.contains('substring')) {
      await _animateSubstring();
    } else if (widget.subtopic.contains('Concatenat')) {
      await _animateConcatenate();
    } else if (widget.subtopic.contains('Same') || widget.subtopic.contains('Check')) {
      await _animateCompare();
    } else {
      await _animateTraversal();
    }
    playing = false;
  }

  Future<void> _animateReverse() async {
    int left = 0, right = chars.length - 1;
    while (left < right) {
      if (!mounted) return;
      setState(() {
        highlightIdx = left; highlightIdx2 = right;
        caption = 'Swapping "${chars[left]}" ↔ "${chars[right]}"';
      });
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        final tmp = chars[left]; chars[left] = chars[right]; chars[right] = tmp;
      });
      await Future.delayed(const Duration(milliseconds: 400));
      left++; right--;
    }
    setState(() { highlightIdx = null; highlightIdx2 = null; caption = 'Reversed: ${chars.join()}'; });
  }

  Future<void> _animateSearch() async {
    final target = chars.isNotEmpty ? chars.last : 'O';
    setState(() { caption = 'Searching for "$target"...'; });
    for (int i = 0; i < chars.length; i++) {
      if (!mounted) return;
      setState(() { highlightIdx = i; caption = 'Checking index $i: "${chars[i]}"'; });
      await Future.delayed(const Duration(milliseconds: 500));
      if (chars[i] == target) {
        setState(() { caption = 'Found "$target" at index $i ✓'; });
        return;
      }
    }
    setState(() { highlightIdx = null; caption = '"$target" not found ✗'; });
  }

  Future<void> _animateLength() async {
    int count = 0;
    for (int i = 0; i < chars.length; i++) {
      if (!mounted) return;
      setState(() { highlightIdx = i; count = i + 1; caption = 'Counting: $count'; });
      await Future.delayed(const Duration(milliseconds: 400));
    }
    setState(() { highlightIdx = null; caption = 'Length = ${chars.length}'; });
  }

  Future<void> _animateRemove() async {
    if (chars.length < 3) return;
    final removeIdx = 2;
    setState(() { highlightIdx = removeIdx; caption = 'Removing "${chars[removeIdx]}" at index $removeIdx'; });
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() { chars.removeAt(removeIdx); highlightIdx = null; caption = 'Result: ${chars.join()}'; });
  }

  Future<void> _animateInsert() async {
    final insertChar = 'X';
    final insertIdx = (chars.length / 2).floor();
    setState(() { highlightIdx = insertIdx; caption = 'Inserting "$insertChar" at index $insertIdx'; });
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() { chars.insert(insertIdx, insertChar); highlightIdx = insertIdx; caption = 'Result: ${chars.join()}'; });
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() { highlightIdx = null; });
  }

  Future<void> _animateSubstring() async {
    final start = 1, end = 4.clamp(0, chars.length);
    for (int i = start; i < end; i++) {
      if (!mounted) return;
      setState(() { highlightIdx = i; caption = 'Substring [$start:$end]: collecting "${chars[i]}"'; });
      await Future.delayed(const Duration(milliseconds: 500));
    }
    final sub = chars.sublist(start, end).join();
    setState(() { highlightIdx = null; caption = 'Substring result: "$sub"'; });
  }

  Future<void> _animateConcatenate() async {
    final str2 = 'WORLD'.split('');
    setState(() { caption = 'Concatenating "${chars.join()}" + "WORLD"...'; });
    await Future.delayed(const Duration(milliseconds: 500));
    for (int i = 0; i < str2.length; i++) {
      if (!mounted) return;
      setState(() { chars.add(str2[i]); highlightIdx = chars.length - 1; caption = 'Appending "${str2[i]}"'; });
      await Future.delayed(const Duration(milliseconds: 400));
    }
    setState(() { highlightIdx = null; caption = 'Result: ${chars.join()}'; });
  }

  Future<void> _animateCompare() async {
    final str2 = chars.toList();
    for (int i = 0; i < chars.length; i++) {
      if (!mounted) return;
      setState(() { highlightIdx = i; caption = 'Comparing "${chars[i]}" == "${str2[i]}": ✓'; });
      await Future.delayed(const Duration(milliseconds: 500));
    }
    setState(() { highlightIdx = null; caption = 'Strings are identical ✓'; });
  }

  Future<void> _animateTraversal() async {
    for (int i = 0; i < chars.length; i++) {
      if (!mounted) return;
      setState(() { highlightIdx = i; caption = 'Index $i: "${chars[i]}"'; });
      await Future.delayed(const Duration(milliseconds: 500));
    }
    setState(() { highlightIdx = null; caption = 'Traversal complete'; });
  }

  void _reset() {
    _loadInput();
    setState(() { caption = 'Reset. Press Play.'; highlightIdx = null; highlightIdx2 = null; });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        // Input
        Row(children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: GoogleFonts.firaCode(color: AppColors.textMain),
              decoration: InputDecoration(hintText: 'Enter string', filled: true, fillColor: AppColors.surface,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: _play, child: const Text('Play')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: _reset, child: const Text('Reset')),
        ]),
        const SizedBox(height: 24),

        // String visualization
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: chars.asMap().entries.map((e) {
              final isHL = highlightIdx == e.key;
              final isHL2 = highlightIdx2 == e.key;
              return Column(children: [
                Text('${e.key}', style: GoogleFonts.firaCode(fontSize: 10, color: AppColors.textSub)),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 42, height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: isHL ? AppColors.accent : isHL2 ? AppColors.warning : AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: (isHL || isHL2) ? Colors.transparent : AppColors.textSub.withOpacity(0.2)),
                  ),
                  child: Center(child: Text(e.value, style: GoogleFonts.firaCode(
                      fontWeight: FontWeight.bold, fontSize: 16,
                      color: (isHL || isHL2) ? Colors.white : AppColors.textMain))),
                ),
              ]);
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Text(caption, style: GoogleFonts.inter(color: AppColors.textSub, fontSize: 14), textAlign: TextAlign.center),
      ]),
    );
  }
}
