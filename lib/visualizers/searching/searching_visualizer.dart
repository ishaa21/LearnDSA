import 'package:flutter/material.dart';
import '../../theme.dart';
import '../array/array_cell.dart';

class SearchingVisualizer extends StatefulWidget {
  final String subtopic;

  const SearchingVisualizer({super.key, required this.subtopic});

  @override
  State<SearchingVisualizer> createState() => _SearchingVisualizerState();
}

class _SearchingVisualizerState extends State<SearchingVisualizer> {
  // Data
  List<int> array = [];
  int target = 0;
  
  // State
  int? low;
  int? high;
  int? mid;
  int? currentIdx; // For linear search
  bool found = false;
  bool playing = false;
  String status = "Ready to search";
  
  // Controls
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _reset() {
    setState(() {
      if (widget.subtopic == 'BinarySearch') {
        array = [10, 23, 35, 42, 58, 61, 74, 88, 95]; // Sorted
      } else {
        array = [42, 10, 88, 35, 95, 23, 61, 58, 74]; // Unsorted for Linear
      }
      target = 42;
      textController.text = target.toString();
      low = 0;
      high = array.length - 1;
      mid = null;
      currentIdx = null;
      found = false;
      playing = false;
      status = "Enter target and press Play";
    });
  }

  Future<void> _play() async {
    if (playing) return;
    
    // Parse target
    setState(() {
      target = int.tryParse(textController.text) ?? 42;
      playing = true;
      found = false;
      status = "Starting search for $target...";
    });

    if (widget.subtopic == 'BinarySearch') {
      await _binarySearch();
    } else {
      await _linearSearch();
    }

    setState(() {
      playing = false;
      if (!found) status = "Not found.";
    });
  }

  Future<void> _linearSearch() async {
    for (int i = 0; i < array.length; i++) {
      if (!playing) return;

      setState(() {
        currentIdx = i;
        status = "Checking index $i: ${array[i]}";
      });

      await Future.delayed(const Duration(milliseconds: 800));

      if (array[i] == target) {
        setState(() {
          status = "Found $target at index $i!";
          found = true;
        });
        return;
      }
    }
  }

  Future<void> _binarySearch() async {
    low = 0;
    high = array.length - 1;

    while (low! <= high!) {
      if (!playing) return;

      mid = (low! + high!) ~/ 2;
      setState(() {
        status = "Middle is index $mid (${array[mid!]})";
      });
      await Future.delayed(const Duration(milliseconds: 800));

      if (array[mid!] == target) {
        setState(() {
          status = "Found $target at index $mid!";
          found = true;
        });
        return;
      } else if (array[mid!] < target) {
        setState(() {
          status = "${array[mid!]} < $target. Ignoring left half.";
          low = mid! + 1;
        });
      } else {
        setState(() {
          status = "${array[mid!]} > $target. Ignoring right half.";
          high = mid! - 1;
        });
      }
      await Future.delayed(const Duration(milliseconds: 800));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 1. Controls Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Target",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: playing ? null : _play,
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text("Search"),
                ),
                const SizedBox(width: 8),
                IconButton(onPressed: _reset, icon: const Icon(Icons.refresh_rounded)),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // 2. Status Text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: found ? AppColors.success.withOpacity(0.1) : AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: found ? AppColors.success : AppColors.accent.withOpacity(0.3),
              ),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: found ? AppColors.success : AppColors.textMain,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),

          // 3. Visualization Area
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(array.length, (index) {
                  // Determine state for coloring
                  bool isActive = false;
                  bool isDimmed = false;
                  Color? cellColor;

                  if (widget.subtopic == 'BinarySearch') {
                    if (low != null && high != null) {
                      if (index < low! || index > high!) isDimmed = true;
                    }
                    if (index == mid) {
                      isActive = true;
                      cellColor = Colors.orange; // Mid pointer
                    }
                  } else {
                    // Linear
                    if (index == currentIdx) isActive = true;
                  }

                  if (found && index == (mid ?? currentIdx)) {
                    cellColor = AppColors.success;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        // Pointers for Binary Search
                        if (widget.subtopic == 'BinarySearch') ...[
                          Text(
                            index == low ? "L" : (index == high ? "H" : ""),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textSub),
                          ),
                          const SizedBox(height: 4),
                        ],
                        
                        Opacity(
                          opacity: isDimmed ? 0.3 : 1.0,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: cellColor ?? (isActive ? AppColors.accent : AppColors.card),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: isActive ? [
                                BoxShadow(color: (cellColor ?? AppColors.accent).withOpacity(0.5), blurRadius: 8)
                              ] : [],
                            ),
                            child: Center(
                              child: Text(
                                array[index].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isActive || cellColor != null) ? Colors.white : AppColors.textMain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 4),
                        Text(index.toString(), style: const TextStyle(fontSize: 10, color: AppColors.textSub)),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
