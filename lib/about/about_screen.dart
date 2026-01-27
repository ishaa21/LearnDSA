import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/developer_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        children: [
          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Developed by',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),

                  const DeveloperCard(
                    name: 'Isha Zalavadia',
                    email: 'ishazalavadia@gmail.com',
                  ),

                  const DeveloperCard(
                    name: 'Rushika Kalariya',
                    email: 'rushikakalariya@gmail.com',
                  ),
                ],
              ),
            ),
          ),

          /// FOOTER (BOTTOM CENTER)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Text(
                  'Built by students, for students.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 4),
                Text(
                  'Version 1.0 • 2025',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.textSub),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
