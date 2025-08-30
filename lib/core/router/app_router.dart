import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshgo/features/onboarding/presentation/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
    ],
  );
});
