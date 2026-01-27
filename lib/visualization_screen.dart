import 'package:flutter/material.dart';
import 'visualizers/visualizer_factory.dart';

class VisualizationScreen extends StatelessWidget {
  final String topic;
  final String subtopic;

  const VisualizationScreen({
    super.key,
    required this.topic,
    required this.subtopic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualization'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: VisualizerFactory.get(
            topic: topic,
            subtopic: subtopic,
          ),
        ),
      ),
    );
  }
}
