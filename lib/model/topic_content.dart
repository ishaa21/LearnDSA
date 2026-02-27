class TopicContent {
  final String title;
  final String whatIsIt; // "Explain Like I'm New" content
  final String whyDoWeNeedIt;
  final String algorithmLogic; // "No Math/No Code" logic
  final String commonMistakes;
  final String timeComplexity;
  final String spaceComplexity;
  final String realLifeApplication;
  final List<String> keyTakeaways;
  final List<String> recommendedProblems;
  final List<MiniPractice> practices;

  TopicContent({
    required this.title,
    required this.whatIsIt,
    required this.whyDoWeNeedIt,
    required this.algorithmLogic,
    required this.commonMistakes,
    required this.timeComplexity,
    required this.spaceComplexity,
    required this.realLifeApplication,
    required this.keyTakeaways,
    required this.recommendedProblems,
    required this.practices,
  });

  factory TopicContent.fromMarkdown(String content) {
    // Helper to safely extract sections
    String extractSection(List<String> variants) {
      for (var variant in variants) {
        final start = content.toLowerCase().indexOf(variant.toLowerCase());
        if (start != -1) {
          // Find the end of this header line
          final headerEnd = content.indexOf('\n', start);
          if (headerEnd == -1) return content.substring(start + variant.length).trim();
          
          // Look for the next main header (level 1 or 2) to find the end of the current section
          // This avoids stopping at ### sub-headers
          final nextHeaderMatch = RegExp(r'\r?\n#{1,2}\s').firstMatch(content.substring(headerEnd));
          
          final section = (nextHeaderMatch == null)
              ? content.substring(headerEnd)
              : content.substring(headerEnd, headerEnd + nextHeaderMatch.start);
          return section.trim();
        }
      }
      return "Content coming soon...";
    }

    // Extract title from first line starting with #
    String title = "Detailed Explanation";
    if (content.trim().startsWith('# ')) {
      final firstLineEnd = content.indexOf('\n');
      title = content.substring(content.indexOf('# ') + 2, firstLineEnd == -1 ? content.length : firstLineEnd).trim();
    }

    // Parse specific sections
    return TopicContent(
      title: title,
      whatIsIt: extractSection(['## What is this?', '## Introduction', '## What is']),
      whyDoWeNeedIt: extractSection(['## Why do we need it?', '## Motivation', '## Why ']),
      algorithmLogic: extractSection(['## Algorithm Logic', '## Logic', '## How it works']),
      commonMistakes: extractSection(['## Common Mistakes', '## Mistakes', '## Pitfalls']),
      timeComplexity: extractSection(['## Time Complexity', '## Complexity']),
      spaceComplexity: extractSection(['## Space Complexity']),
      realLifeApplication: extractSection(['## Real Life Use', '## Applications']),
      keyTakeaways: _parseBulletPoints(extractSection(['## Key Takeaways', '## Summary'])),
      recommendedProblems: _parseBulletPoints(extractSection(['## Recommended Problems', '## Problems', '## Practice Problems'])),
      practices: _parsePractices(extractSection(['## Mini Practice', '## Challenge', '##minin practice'])),
    );
  }

  static List<String> _parseBulletPoints(String section) {
    if (section == "Content coming soon..." || section.isEmpty) return [];
    return section.split('\n')
        .where((line) => line.trim().startsWith('-') || line.trim().startsWith('*') || RegExp(r'^\d+\.').hasMatch(line.trim()))
        .map((line) {
          String cleaned = line.trim();
          if (cleaned.startsWith('-') || cleaned.startsWith('*')) {
            return cleaned.substring(1).trim();
          }
          if (RegExp(r'^\d+\.').hasMatch(cleaned)) {
            return cleaned.replaceFirst(RegExp(r'^\d+\.'), '').trim();
          }
          return cleaned;
        })
        .where((line) => line.isNotEmpty)
        .toList();
  }

  static List<MiniPractice> _parsePractices(String section) {
    if (section == "Content coming soon..." || section.isEmpty) return [];
    
    List<MiniPractice> list = [];
    final problems = section.split('### Problem');
    for (var p in problems) {
      if (p.trim().isEmpty) continue;
      
      // The first part before "Input:" is the title + description
      final inputIdx = p.indexOf('Input:');
      String questionWithDesc = (inputIdx == -1) 
          ? p.trim() 
          : p.substring(0, inputIdx).trim();
      
      // Split by newline to separate Title and Description
      final lines = questionWithDesc.split('\n');
      String title = lines[0].replaceAll(':', '').trim();
      String description = lines.length > 1 
          ? lines.sublist(1).join('\n').trim() 
          : "";

      list.add(MiniPractice(
        question: title,
        description: description,
        input: _extract(p, 'Input:'),
        output: _extract(p, 'Output:'),
        hint: _extract(p, 'Hint:'),
        solution: _extract(p, 'Solution:'),
      ));
    }
    return list;
  }

  static String _extract(String text, String label) {
    final start = text.indexOf(label);
    if (start == -1) return "N/A";
    
    // Find where the next label starts or the end of the text
    List<String> labels = ['Input:', 'Output:', 'Hint:', 'Solution:', '### Problem'];
    int end = text.length;
    for (var l in labels) {
      if (l == label) continue;
      final idx = text.indexOf(l, start + label.length);
      if (idx != -1 && idx < end) {
        end = idx;
      }
    }
    
    return text.substring(start + label.length, end).trim();
  }
}

class MiniPractice {
  final String question;
  final String description;
  final String input;
  final String output;
  final String hint;
  final String solution;

  MiniPractice({
    required this.question,
    required this.description,
    required this.input,
    required this.output,
    required this.hint,
    required this.solution,
  });
}
