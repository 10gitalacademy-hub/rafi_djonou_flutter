import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(title: Text(Translations.get('sell_title', language))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.store, size: 64, color: AppTheme.divider),
            const SizedBox(height: 16),
            Text(Translations.get('login_to_sell', language)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(Translations.get('login', language)),
            ),
          ],
        ),
      ),
    );
  }
}
