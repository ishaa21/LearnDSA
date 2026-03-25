import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import '../models/mock_test.dart';
import '../models/mistake.dart';
import '../providers/mock_test_provider.dart';
import '../providers/mistake_provider.dart';
import '../providers/leaderboard_provider.dart';
import '../models/leaderboard_entry.dart';
import 'test_result_screen.dart';

class TestScreen extends StatefulWidget {
  final List<MockTestQuestion> questions;
  final String sectionId;
  final String sectionName;
  final String difficulty;

  const TestScreen({
    super.key,
    required this.questions,
    required this.sectionId,
    required this.sectionName,
    required this.difficulty,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _currentIndex = 0;
  Map<int, int> _answers = {}; // questionIndex -> selectedOption
  Map<int, int> _timeSpent = {}; // questionIndex -> seconds spent
  late Timer _timer;
  int _totalSeconds = 0;
  int _questionSeconds = 0;
  bool _showHint = false;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        _totalSeconds++;
        _questionSeconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _selectAnswer(int optionIndex) {
    if (_submitted) return;
    setState(() {
      _answers[_currentIndex] = optionIndex;
    });
  }

  void _nextQuestion() {
    _timeSpent[_currentIndex] = _questionSeconds;
    _questionSeconds = 0;
    _showHint = false;
    if (_currentIndex < widget.questions.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _prevQuestion() {
    _timeSpent[_currentIndex] = _questionSeconds;
    _questionSeconds = 0;
    _showHint = false;
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  void _goToQuestion(int index) {
    _timeSpent[_currentIndex] = _questionSeconds;
    _questionSeconds = 0;
    _showHint = false;
    setState(() => _currentIndex = index);
  }

  void _submitTest() {
    _timer.cancel();
    _timeSpent[_currentIndex] = _questionSeconds;

    // Calculate results
    int correct = 0;
    Map<String, int> topicCorrect = {};
    Map<String, int> topicTotal = {};
    List<String> wrongIds = [];
    Map<String, int> timePerQ = {};

    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      topicTotal[q.topic] = (topicTotal[q.topic] ?? 0) + 1;
      timePerQ[q.id] = _timeSpent[i] ?? 0;

      if (_answers[i] == q.correct) {
        correct++;
        topicCorrect[q.topic] = (topicCorrect[q.topic] ?? 0) + 1;
      } else {
        wrongIds.add(q.id);

        // Add to mistake tracker
        final mistakeProvider = Provider.of<MistakeProvider>(context, listen: false);
        mistakeProvider.addMistake(MistakeEntry(
          questionId: q.id,
          question: q.question,
          correctAnswer: q.options[q.correct],
          userAnswer: _answers[i] != null ? q.options[_answers[i]!] : 'Not answered',
          topic: q.topic,
          difficulty: q.difficulty,
          source: 'mock_test',
          timestamp: DateTime.now(),
        ));
      }
    }

    final testId = 'test_${DateTime.now().millisecondsSinceEpoch}';

    final attempt = TestAttempt(
      testId: testId,
      sectionId: widget.sectionId,
      sectionName: widget.sectionName,
      difficulty: widget.difficulty,
      timestamp: DateTime.now(),
      totalQuestions: widget.questions.length,
      correctAnswers: correct,
      totalTimeSeconds: _totalSeconds,
      topicCorrect: topicCorrect,
      topicTotal: topicTotal,
      wrongQuestionIds: wrongIds,
      timePerQuestion: timePerQ,
    );

    // Save attempt
    Provider.of<MockTestProvider>(context, listen: false).saveAttempt(attempt);

    // Add to leaderboard
    Provider.of<LeaderboardProvider>(context, listen: false).addEntry(
      LeaderboardEntry(
        testId: testId,
        sectionName: widget.sectionName,
        score: correct,
        totalQuestions: widget.questions.length,
        accuracy: attempt.accuracy,
        timeSeconds: _totalSeconds,
        timestamp: DateTime.now(),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TestResultScreen(attempt: attempt, questions: widget.questions, answers: _answers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.background : AppColors.lightBackground;
    final textMain = isDark ? AppColors.textMain : AppColors.lightTextMain;
    final textSub = isDark ? AppColors.textSub : AppColors.lightTextSub;
    final cardColor = isDark ? AppColors.card : AppColors.lightCard;
    final accentColor = isDark ? AppColors.accent : AppColors.lightAccent;

    final question = widget.questions[_currentIndex];
    final answered = _answers.length;
    final total = widget.questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _showExitDialog();
      },
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          title: Text('${widget.sectionName} • ${widget.difficulty}', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: textMain, fontSize: 16)),
          actions: [
            // Timer
            Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timer_outlined, size: 16, color: accentColor),
                  const SizedBox(width: 4),
                  Text(_formatTime(_totalSeconds), style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: accentColor)),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Q${_currentIndex + 1}/$total', style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold, color: textMain)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: (_currentIndex + 1) / total,
                        minHeight: 6,
                        backgroundColor: isDark ? AppColors.surface : AppColors.lightSurface,
                        valueColor: AlwaysStoppedAnimation(accentColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('$answered answered', style: GoogleFonts.inter(fontSize: 11, color: textSub)),
                ],
              ),
            ),

            // Question
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Difficulty + Topic
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _diffColor(question.difficulty).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(question.difficulty, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: _diffColor(question.difficulty))),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text(question.topic, style: GoogleFonts.inter(fontSize: 11, color: accentColor, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Question text
                    Text(question.question, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: textMain, height: 1.4)),
                    const SizedBox(height: 24),

                    // Options
                    ...question.options.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final option = entry.value;
                      final isSelected = _answers[_currentIndex] == idx;

                      return GestureDetector(
                        onTap: () => _selectAnswer(idx),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected ? accentColor.withOpacity(0.15) : cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? accentColor : (isDark ? AppColors.surface : AppColors.lightSurface),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32, height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected ? accentColor : (isDark ? AppColors.surface : AppColors.lightSurface),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + idx),
                                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isSelected ? Colors.white : textSub, fontSize: 14),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(child: Text(option, style: GoogleFonts.inter(fontSize: 15, color: textMain, height: 1.3))),
                            ],
                          ),
                        ),
                      );
                    }),

                    // Hint
                    if (!_showHint)
                      TextButton.icon(
                        onPressed: () => setState(() => _showHint = true),
                        icon: Icon(Icons.lightbulb_outline, size: 18, color: AppColors.warning),
                        label: Text('Show Hint', style: GoogleFonts.inter(color: AppColors.warning, fontWeight: FontWeight.w600)),
                      )
                    else
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.warning.withOpacity(0.2)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.lightbulb, size: 18, color: AppColors.warning),
                            const SizedBox(width: 10),
                            Expanded(child: Text(question.hint, style: GoogleFonts.inter(fontSize: 13, color: textMain))),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Question palette + Navigation
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: cardColor,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))],
              ),
              child: Column(
                children: [
                  // Question palette
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: total,
                      itemBuilder: (_, i) {
                        final isAnswered = _answers.containsKey(i);
                        final isCurrent = i == _currentIndex;
                        return GestureDetector(
                          onTap: () => _goToQuestion(i),
                          child: Container(
                            width: 36, height: 36,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: isCurrent ? accentColor : isAnswered ? AppColors.success.withOpacity(0.2) : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: isCurrent ? accentColor : isAnswered ? AppColors.success : textSub.withOpacity(0.3)),
                            ),
                            child: Center(
                              child: Text('${i + 1}', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: isCurrent ? Colors.white : isAnswered ? AppColors.success : textSub)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Nav buttons
                  Row(
                    children: [
                      if (_currentIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _prevQuestion,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accentColor),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text('Previous', style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: accentColor)),
                          ),
                        )
                      else
                        const Expanded(child: SizedBox()),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _currentIndex == total - 1 ? _confirmSubmit : _nextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _currentIndex == total - 1 ? AppColors.success : accentColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            _currentIndex == total - 1 ? 'Submit Test' : 'Next',
                            style: GoogleFonts.outfit(fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _diffColor(String diff) {
    switch (diff) {
      case 'Easy': return AppColors.success;
      case 'Medium': return AppColors.warning;
      case 'Hard': return AppColors.error;
      default: return AppColors.info;
    }
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  void _confirmSubmit() {
    final unanswered = widget.questions.length - _answers.length;
    if (unanswered > 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Submit Test?', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
          content: Text('You have $unanswered unanswered question${unanswered > 1 ? 's' : ''}. Are you sure you want to submit?'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Review')),
            ElevatedButton(
              onPressed: () { Navigator.pop(ctx); _submitTest(); },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    } else {
      _submitTest();
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Exit Test?', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: const Text('Your progress will be lost if you exit now.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Continue Test')),
          ElevatedButton(
            onPressed: () { Navigator.pop(ctx); Navigator.pop(context); },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Exit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
