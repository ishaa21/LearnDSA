import 'package:flutter/material.dart';
import '../theme.dart';

class EmptyVisualizer extends StatelessWidget {
  const EmptyVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.visibility_off_outlined,
            size: 48,
            color: AppColors.textSub,
          ),
          const SizedBox(height: 16),
          Text(
            'Visualization coming soon',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'We’re building a visual explanation\nfor this topic 🌱',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
