import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../app/theme.dart';
import '../app/i18n.dart';
import '../app/app_state.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  String _selectedLanguage = 'fr';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Language Selector
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '💎 RAFI DJONOU',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    items: [
                      DropdownMenuItem(
                        value: 'fr',
                        child: Text(
                          Translations.get('french', _selectedLanguage),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          Translations.get('english', _selectedLanguage),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedLanguage = value;
                        });
                        appState.setLanguage(value);
                      }
                    },
                  ),
                ],
              ),
            ),
            // Onboarding Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildOnboardingPage(
                    icon: '💎',
                    title: Translations.get('discover_unique', _selectedLanguage),
                    description: Translations.get('jewelry_description', _selectedLanguage),
                  ),
                  _buildOnboardingPage(
                    icon: '🎨',
                    title: Translations.get('customize_jewelry', _selectedLanguage),
                    description: Translations.get('customize_description', _selectedLanguage),
                  ),
                  _buildOnboardingPage(
                    icon: '🌸',
                    title: Translations.get('find_perfect_size', _selectedLanguage),
                    description: Translations.get('waist_description', _selectedLanguage),
                  ),
                ],
              ),
            ),
            // Page Indicator and Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppTheme.primaryGold,
                      dotColor: AppTheme.divider,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.go('/main');
                        },
                        child: Text(
                          Translations.get('skip', _selectedLanguage),
                          style: const TextStyle(
                            color: AppTheme.secondaryText,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (_currentPage < 2)
                        ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(Translations.get('next', _selectedLanguage)),
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            context.go('/main');
                          },
                          child: Text(Translations.get('get_started', _selectedLanguage)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.secondaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
