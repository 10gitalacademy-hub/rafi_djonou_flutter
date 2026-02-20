import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/sell_screen.dart';
import '../screens/alerts_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/waist_assistant_screen.dart';
import '../screens/customize_screen.dart';
import '../screens/main_navigation_screen.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainNavigationScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailScreen(productId: int.parse(id));
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/sell',
      builder: (context, state) => const SellScreen(),
    ),
    GoRoute(
      path: '/alerts',
      builder: (context, state) => const AlertsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/waist-assistant',
      builder: (context, state) => const WaistAssistantScreen(),
    ),
    GoRoute(
      path: '/customize',
      builder: (context, state) => const CustomizeScreen(),
    ),
  ],
);
