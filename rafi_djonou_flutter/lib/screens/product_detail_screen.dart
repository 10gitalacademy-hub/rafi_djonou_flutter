import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;
    final product = Product.mockProducts.firstWhere(
      (p) => p.id == productId,
      orElse: () => Product.mockProducts[0],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery
            Container(
              height: 300,
              color: AppTheme.background,
              child: const Center(
                child: Icon(Icons.image, size: 80, color: AppTheme.divider),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${product.price.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.secondaryText,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Variants
                  Text(
                    'Couleurs',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: product.colors
                        .map((color) => Chip(label: Text(color)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tailles',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: product.sizes
                        .map((size) => Chip(label: Text(size)))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        appState.addToCart({
                          'id': product.id,
                          'name': product.name,
                          'price': product.price,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${product.name} ajouté au panier',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        Translations.get('add_to_cart', language),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
