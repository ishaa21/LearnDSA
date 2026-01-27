import 'package:flutter/material.dart';
import 'engine/visual_player.dart';
import 'engine/visual_step.dart';

class StackVisualizer extends StatelessWidget {
  final String subtopic;

  const StackVisualizer({
    super.key,
    required this.subtopic,
  });

  List<VisualStep> _generateSteps() {
    if (subtopic.contains('Push')) {
      return _pushSteps();
    }

    if (subtopic.contains('Pop')) {
      return _popSteps();
    }

    if (subtopic.contains('Peek')) {
      return _peekSteps();
    }

    if (subtopic.contains('Postfix') &&
        subtopic.contains('Evaluation')) {
      return _evaluatePostfix('23*54*+');
    }

    if (subtopic.contains('Prefix') &&
        subtopic.contains('Evaluation')) {
      return _evaluatePrefix('+9*26');
    }

    if (subtopic.contains('Infix') &&
        subtopic.contains('Evaluation')) {
      return _evaluateInfix('2+3*4');
    }

    return [];
  }

  /* ================= PUSH ================= */
  List<VisualStep> _pushSteps() {
    final stack = <String>[];
    final steps = <VisualStep>[];

    for (var v in ['10', '20', '30']) {
      stack.add(v);
      steps.add(
        VisualStep(
          state: List.from(stack),
          highlight: [v],
          explanation: 'Push $v onto stack',
        ),
      );
    }
    return steps;
  }

  /* ================= POP ================= */
  List<VisualStep> _popSteps() {
    final stack = ['10', '20', '30'];
    final steps = <VisualStep>[];

    final popped = stack.removeLast();
    steps.add(
      VisualStep(
        state: List.from(stack),
        highlight: [],
        explanation: 'Pop $popped from stack',
      ),
    );

    return steps;
  }

  /* ================= PEEK ================= */
  List<VisualStep> _peekSteps() {
    final stack = ['10', '20', '30'];

    return [
      VisualStep(
        state: stack,
        highlight: ['30'],
        explanation: 'Peek top element (30)',
      ),
    ];
  }

  /* ================= POSTFIX EVALUATION ================= */
  List<VisualStep> _evaluatePostfix(String expr) {
    final stack = <int>[];
    final steps = <VisualStep>[];

    for (final ch in expr.split('')) {
      if (_isDigit(ch)) {
        stack.add(int.parse(ch));
        steps.add(
          VisualStep(
            state: List.from(stack),
            highlight: [stack.last],
            explanation: 'Push operand $ch',
          ),
        );
      } else {
        final b = stack.removeLast();
        final a = stack.removeLast();
        final res = _apply(a, b, ch);

        stack.add(res);
        steps.add(
          VisualStep(
            state: List.from(stack),
            highlight: [res],
            explanation: 'Apply $a $ch $b = $res',
          ),
        );
      }
    }
    return steps;
  }

  /* ================= PREFIX EVALUATION ================= */
  List<VisualStep> _evaluatePrefix(String expr) {
    final stack = <int>[];
    final steps = <VisualStep>[];

    for (final ch in expr.split('').reversed) {
      if (_isDigit(ch)) {
        stack.add(int.parse(ch));
        steps.add(
          VisualStep(
            state: List.from(stack),
            highlight: [stack.last],
            explanation: 'Push operand $ch',
          ),
        );
      } else {
        final a = stack.removeLast();
        final b = stack.removeLast();
        final res = _apply(a, b, ch);

        stack.add(res);
        steps.add(
          VisualStep(
            state: List.from(stack),
            highlight: [res],
            explanation: 'Apply $a $ch $b = $res',
          ),
        );
      }
    }
    return steps;
  }

  /* ================= INFIX EVALUATION ================= */
  List<VisualStep> _evaluateInfix(String expr) {
    // simplified demo
    return _evaluatePostfix('234*+');
  }

  bool _isDigit(String s) =>
      int.tryParse(s) != null;

  int _apply(int a, int b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a ~/ b;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = _generateSteps();

    if (steps.isEmpty) {
      return const Center(
        child: Text('Visualization not available'),
      );
    }

    return VisualPlayer(steps: steps);
  }
}
