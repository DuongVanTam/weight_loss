import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

/// Demo page to preview and test the app theme
/// This page showcases all the theme components and colors
class ThemePreviewPage extends StatelessWidget {
  const ThemePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Typography Section
            _buildSection(
              'Typography',
              [
                Text('Display Large', style: AppTypography.displayLarge),
                Text('Headline Large', style: AppTypography.headlineLarge),
                Text('Title Large', style: AppTypography.titleLarge),
                Text('Body Large', style: AppTypography.bodyLarge),
                Text('Body Medium', style: AppTypography.bodyMedium),
                Text('Label Large', style: AppTypography.labelLarge),
                const SizedBox(height: 16),
                Text('Workout Title', style: AppTypography.workoutTitle),
                Text('Stats Number: 42', style: AppTypography.statsNumber),
                Text('Stats Label', style: AppTypography.statsLabel),
              ],
            ),
            
            // Colors Section
            _buildSection(
              'Colors',
              [
                _buildColorRow('Primary', AppColors.primary),
                _buildColorRow('Secondary', AppColors.secondary),
                _buildColorRow('Success', AppColors.success),
                _buildColorRow('Warning', AppColors.warning),
                _buildColorRow('Danger', AppColors.danger),
                _buildColorRow('Text Primary', AppColors.textPrimary),
                _buildColorRow('Text Secondary', AppColors.textSecondary),
              ],
            ),

            // Buttons Section
            _buildSection(
              'Buttons',
              [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
              ],
            ),

            // Input Fields Section
            _buildSection(
              'Input Fields',
              [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Label Text',
                    hintText: 'Hint text here',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'With Prefix Icon',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ],
            ),

            // Cards Section
            _buildSection(
              'Cards',
              [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Title', style: AppTypography.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          'This is a sample card content to showcase the card theme.',
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Chips Section
            _buildSection(
              'Chips',
              [
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      label: const Text('Cardio'),
                      onDeleted: () {},
                    ),
                    const Chip(label: Text('HIIT')),
                    ChoiceChip(
                      label: const Text('Yoga'),
                      selected: true,
                      onSelected: (selected) {},
                    ),
                    const Chip(label: Text('Strength')),
                  ],
                ),
              ],
            ),

            // Progress Indicators Section
            _buildSection(
              'Progress Indicators',
              [
                const LinearProgressIndicator(value: 0.7),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    CircularProgressIndicator(value: 0.3),
                    SizedBox(width: 16),
                    CircularProgressIndicator(),
                  ],
                ),
              ],
            ),

            // List Items Section
            _buildSection(
              'List Items',
              [
                ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: const Text('Push-ups'),
                  subtitle: const Text('3 sets x 15 reps'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.timer),
                  title: const Text('Rest Timer'),
                  subtitle: const Text('60 seconds'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(title, style: AppTypography.headlineSmall),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildColorRow(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.labelMedium),
                Text(
                  '#${color.r.toInt().toRadixString(16).padLeft(2, '0')}${color.g.toInt().toRadixString(16).padLeft(2, '0')}${color.b.toInt().toRadixString(16).padLeft(2, '0')}'.toUpperCase(),
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
