import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  String _sortBy = 'popular';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;
    final products = Product.mockProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('search', language)),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: Translations.get('search_jewelry', language),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Filter and Sort
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: Text(Translations.get('filter', language)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.background,
                    foregroundColor: AppTheme.darkText,
                  ),
                ),
                DropdownButton<String>(
                  value: _sortBy,
                  items: [
                    DropdownMenuItem(
                      value: 'popular',
                      child: Text(Translations.get('popular', language)),
                    ),
                    DropdownMenuItem(
                      value: 'price_low',
                      child: Text('Prix croissant'),
                    ),
                    DropdownMenuItem(
                      value: 'price_high',
                      child: Text('Prix décroissant'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _sortBy = value;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          // Results Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${products.length} ${Translations.get('results', language)}',
                style: const TextStyle(
                  color: AppTheme.secondaryText,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          // Products Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
