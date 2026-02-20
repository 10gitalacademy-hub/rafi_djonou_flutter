import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('profile_title', language)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!appState.isLoggedIn)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person_outline,
                          size: 64, color: AppTheme.divider),
                      const SizedBox(height: 16),
                      Text(Translations.get('not_logged_in', language)),
                      const SizedBox(height: 8),
                      Text(
                        Translations.get('login_to_profile', language),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppTheme.secondaryText,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(Translations.get('login', language)),
                      ),
                    ],
                  ),
                ),
              ),
            // Settings Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translations.get('settings', language),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(Translations.get('language', language)),
                    trailing: DropdownButton<String>(
                      value: language,
                      items: [
                        DropdownMenuItem(
                          value: 'fr',
                          child: Text(
                            Translations.get('french', language),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            Translations.get('english', language),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          appState.setLanguage(value);
                        }
                      },
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
