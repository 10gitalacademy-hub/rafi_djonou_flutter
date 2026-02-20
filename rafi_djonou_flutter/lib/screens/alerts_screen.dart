import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final language = appState.language;

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('alerts_title', language)),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: Translations.get('wishlist', language)),
            Tab(text: Translations.get('notifications', language)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Wishlist Tab
          appState.favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.favorite_outline,
                          size: 64, color: AppTheme.divider),
                      const SizedBox(height: 16),
                      Text(Translations.get('no_favorites', language)),
                      const SizedBox(height: 8),
                      Text(
                        Translations.get('add_to_favorites', language),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppTheme.secondaryText,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: appState.favorites.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Favori ${appState.favorites[index]}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          appState.toggleFavorite(appState.favorites[index]);
                        },
                      ),
                    );
                  },
                ),
          // Notifications Tab
          Center(
            child: Text(Translations.get('notifications', language)),
          ),
        ],
      ),
    );
  }
}
