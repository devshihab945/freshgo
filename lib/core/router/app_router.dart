import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshgo/features/home/presentation/home_screen.dart';
import 'package:freshgo/core/bottom_nav.dart';
import 'package:freshgo/features/onboarding/presentation/onboarding_screen.dart';
import 'package:freshgo/features/order_tracking/presentation/order_tracking_screen.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: '/nav', builder: (context, state) => const BottomNavScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/track', builder: (context, state) => const OrderTrackingScreen()),
    ],
  );
});
