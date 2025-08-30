import 'package:flutter/material.dart';
import 'package:freshgo/core/utils/assets_path.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int index = 0;

  final pages = [
    const _OnboardPage(
      imagePath: AssetsPath.onboarding1PNG,
      title: 'Bring Happiness Local Food with Freshgo',
      subtitle:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard',
    ),
    const _OnboardPage(
      imagePath: AssetsPath.onboarding2PNG,
      title: 'Track Your Order in Real-time',
      subtitle:
          'Know exactly where your courier is. Stay updated from checkout to your doorstep.',
    ),
    const _OnboardPage(
      imagePath: AssetsPath.onboarding3PNG,
      title: 'Exclusive Deals Everyday',
      subtitle: 'Claim your discount vouchers and save on every order.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image + PageView + Indicator
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller,
                    onPageChanged: (i) => setState(() => index = i),
                    itemCount: pages.length,
                    itemBuilder: (_, i) => pages[i],
                  ),

                  // indicator
                  Positioned(
                    bottom: 16,
                    left: MediaQuery.of(context).size.width * 0.40,
                    right: MediaQuery.of(context).size.width * 0.40,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30), // pill shape
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pages.length,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: index == i ? 16 : 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: index == i
                                  ? const Color(0xFF22C55E) // active dot green
                                  : Colors.grey, // inactive dot grey
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Title + Subtitle
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pages[index].title,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        pages[index].subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50, // fixed height
                      child: ElevatedButton(
                        onPressed: () => context.go('/nav'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text('Skip tour'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 50, // fixed height
                      child: ElevatedButton(
                        onPressed: () => context.go('/nav'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF22C55E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text('Get started'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // Login Text
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account? ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontWeight: FontWeight.w600,
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

class _OnboardPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _OnboardPage({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover);
  }
}
