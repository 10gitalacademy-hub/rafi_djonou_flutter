import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  String? _selectedBeadType;
  String? _selectedColor;
  String? _selectedPattern;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('customize_title', language)),
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
                      '🎨',
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      Translations.get('design_your_jewelry', language),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Bead Type Selection
              Text(
                Translations.get('select_beads', language),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: ['Verre', 'Pierre', 'Bois', 'Métal']
                    .map((type) => FilterChip(
                          label: Text(type),
                          selected: _selectedBeadType == type,
                          onSelected: (selected) {
                            setState(() {
                              _selectedBeadType = selected ? type : null;
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              // Color Selection
              Text(
                Translations.get('select_colors', language),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                children: [
                  _buildColorOption('Or', Colors.orange),
                  _buildColorOption('Argent', Colors.grey),
                  _buildColorOption('Noir', Colors.black),
                  _buildColorOption('Blanc', Colors.white),
                  _buildColorOption('Rose', Colors.pink),
                  _buildColorOption('Bleu', Colors.blue),
                ],
              ),
              const SizedBox(height: 24),
              // Pattern Selection
              Text(
                Translations.get('select_pattern', language),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: ['Uni', 'Rayé', 'Pointillé', 'Géométrique']
                    .map((pattern) => FilterChip(
                          label: Text(pattern),
                          selected: _selectedPattern == pattern,
                          onSelected: (selected) {
                            setState(() {
                              _selectedPattern = selected ? pattern : null;
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32),
              // Preview
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.divider),
                  color: AppTheme.background,
                ),
                child: Column(
                  children: [
                    Text(
                      Translations.get('preview', language),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.white,
                        border: Border.all(color: AppTheme.divider),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 60,
                          color: AppTheme.divider,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    appState.addToCart({
                      'name': 'Bijou Personnalisé',
                      'price': 35.00,
                      'beads': _selectedBeadType,
                      'color': _selectedColor,
                      'pattern': _selectedPattern,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          Translations.get('add_to_cart_custom', language),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    Translations.get('add_to_cart_custom', language),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(String name, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = name;
        });
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                color: _selectedColor == name
                    ? AppTheme.primaryGold
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
