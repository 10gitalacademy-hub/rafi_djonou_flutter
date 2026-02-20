import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('my_cart', language)),
      ),
      body: appState.cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined,
                      size: 64, color: AppTheme.divider),
                  const SizedBox(height: 16),
                  Text(
                    Translations.get('empty_cart', language),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(Translations.get('explore', language)),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: appState.cart.length,
                    itemBuilder: (context, index) {
                      final item = appState.cart[index];
                      return ListTile(
                        title: Text(item['name'] ?? 'Produit'),
                        subtitle: Text('${item['price']} €'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => appState.removeFromCart(index),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Translations.get('total', language)),
                          Text(
                            '${appState.cartTotal.toStringAsFixed(2)} €',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(Translations.get('checkout', language)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
