import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class WaistAssistantScreen extends StatelessWidget {
  const WaistAssistantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('waist_assistant', language)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.lightGold,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🌸',
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      Translations.get('find_perfect_size', language),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Translations.get('waist_description', language),
                      style: const TextStyle(
                        color: AppTheme.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Steps
              _buildStep(
                context,
                '1',
                Translations.get('step_1', language),
                Translations.get('take_measuring_tape', language),
                '📏',
              ),
              const SizedBox(height: 16),
              _buildStep(
                context,
                '2',
                Translations.get('step_2', language),
                Translations.get('wrap_around_hips', language),
                '📐',
              ),
              const SizedBox(height: 16),
              _buildStep(
                context,
                '3',
                Translations.get('step_3', language),
                Translations.get('note_measurement', language),
                '📝',
              ),
              const SizedBox(height: 24),
              // Size Guide
              Text(
                Translations.get('size_guide', language),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              _buildSizeRow('XS', '60-70 cm'),
              _buildSizeRow('S', '70-80 cm'),
              _buildSizeRow('M', '80-95 cm'),
              _buildSizeRow('L', '95-110 cm'),
              _buildSizeRow('XL', '110-130 cm'),
              const SizedBox(height: 24),
              // CTA Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    Translations.get('take_measurements', language),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String number, String title,
      String description, String emoji) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.secondaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeRow(String size, String range) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(range, style: const TextStyle(color: AppTheme.secondaryText)),
        ],
      ),
    );
  }
}
