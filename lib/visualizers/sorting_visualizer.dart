import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class SortingVisualizer extends StatelessWidget {
  final String subtopic;

  const SortingVisualizer({
    super.key,
    required this.subtopic,
  });

  List<VisualStep> _generateSteps() {
    switch (subtopic) {
      case 'BubbleSort':
        return _bubbleSortSteps([5, 3, 1, 4, 2]);

      case 'MergeSort':
        return _mergeSortSteps([5, 3, 1, 4, 2]);

      case 'QuickSort':
        return _quickSortSteps([5, 3, 1, 4, 2]);

      case 'InsertionSort':
        return _insertionSortSteps([5, 3, 1, 4, 2]);

      case 'SelectionSort':
        return _selectionSortSteps([5, 3, 1, 4, 2]);

      default:
        return [];
    }
  }

  /* ================= BUBBLE SORT ================= */
  List<VisualStep> _bubbleSortSteps(List<int> arr) {
    final steps = <VisualStep>[];

    for (int i = 0; i < arr.length; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        steps.add(
          VisualStep(
            state: List.from(arr),
            highlight: [j, j + 1],
            explanation: 'Compare ${arr[j]} and ${arr[j + 1]}',
          ),
        );

        if (arr[j] > arr[j + 1]) {
          final temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;

          steps.add(
            VisualStep(
              state: List.from(arr),
              highlight: [j, j + 1],
              explanation: 'Swap ${arr[j]} and ${arr[j + 1]}',
            ),
          );
        }
      }
    }
    return steps;
  }

  /* ================= INSERTION SORT ================= */
  List<VisualStep> _insertionSortSteps(List<int> arr) {
    final steps = <VisualStep>[];

    for (int i = 1; i < arr.length; i++) {
      int key = arr[i];
      int j = i - 1;

      steps.add(
        VisualStep(
          state: List.from(arr),
          highlight: [i],
          explanation: 'Pick ${arr[i]} as key',
        ),
      );

      while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];

        steps.add(
          VisualStep(
            state: List.from(arr),
            highlight: [j, j + 1],
            explanation: 'Shift ${arr[j]} to the right',
          ),
        );
        j--;
      }

      arr[j + 1] = key;

      steps.add(
        VisualStep(
          state: List.from(arr),
          highlight: [j + 1],
          explanation: 'Insert key at correct position',
        ),
      );
    }
    return steps;
  }

  /* ================= SELECTION SORT ================= */
  List<VisualStep> _selectionSortSteps(List<int> arr) {
    final steps = <VisualStep>[];

    for (int i = 0; i < arr.length - 1; i++) {
      int minIdx = i;

      for (int j = i + 1; j < arr.length; j++) {
        steps.add(
          VisualStep(
            state: List.from(arr),
            highlight: [minIdx, j],
            explanation: 'Find minimum element',
          ),
        );

        if (arr[j] < arr[minIdx]) {
          minIdx = j;
        }
      }

      final temp = arr[minIdx];
      arr[minIdx] = arr[i];
      arr[i] = temp;

      steps.add(
        VisualStep(
          state: List.from(arr),
          highlight: [i],
          explanation: 'Place minimum at position $i',
        ),
      );
    }
    return steps;
  }

  /* ================= MERGE SORT ================= */
  List<VisualStep> _mergeSortSteps(List<int> arr) {
    final steps = <VisualStep>[];

    void mergeSort(List<int> a, int l, int r) {
      if (l >= r) return;

      int mid = (l + r) ~/ 2;

      steps.add(
        VisualStep(
          state: List.from(a),
          highlight: [l, r],
          explanation: 'Divide array',
        ),
      );

      mergeSort(a, l, mid);
      mergeSort(a, mid + 1, r);

      final merged = [...a.sublist(l, mid + 1), ...a.sublist(mid + 1, r + 1)]
        ..sort();

      for (int i = 0; i < merged.length; i++) {
        a[l + i] = merged[i];
      }

      steps.add(
        VisualStep(
          state: List.from(a),
          highlight: List.generate(r - l + 1, (i) => l + i),
          explanation: 'Merge sorted halves',
        ),
      );
    }

    mergeSort(arr, 0, arr.length - 1);
    return steps;
  }

  /* ================= QUICK SORT ================= */
  List<VisualStep> _quickSortSteps(List<int> arr) {
    final steps = <VisualStep>[];

    void quickSort(List<int> a, int low, int high) {
      if (low >= high) return;

      int pivot = a[high];
      int i = low;

      steps.add(
        VisualStep(
          state: List.from(a),
          highlight: [high],
          explanation: 'Choose pivot $pivot',
        ),
      );

      for (int j = low; j < high; j++) {
        if (a[j] < pivot) {
          final temp = a[i];
          a[i] = a[j];
          a[j] = temp;

          steps.add(
            VisualStep(
              state: List.from(a),
              highlight: [i, j],
              explanation: 'Swap smaller element with pivot side',
            ),
          );
          i++;
        }
      }

      final temp = a[i];
      a[i] = a[high];
      a[high] = temp;

      steps.add(
        VisualStep(
          state: List.from(a),
          highlight: [i],
          explanation: 'Place pivot in correct position',
        ),
      );

      quickSort(a, low, i - 1);
      quickSort(a, i + 1, high);
    }

    quickSort(arr, 0, arr.length - 1);
    return steps;
  }

  @override
  Widget build(BuildContext context) {
    final steps = _generateSteps();

    if (steps.isEmpty) {
      return const Center(child: Text('Visualization not available'));
    }

    return VisualPlayer(steps: steps);
  }
}
