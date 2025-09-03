import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/section_header.dart';
import '../widgets/category_chip.dart';
import '../widgets/promo_card.dart';
import '../widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// Top Bar
            SliverToBoxAdapter(
              child: _TopBar(onTrackPressed: () => context.go('/track')),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            /// Search Bar
            const SliverToBoxAdapter(child: _SearchBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            /// Promo Slider
            const SliverToBoxAdapter(child: _PromoSlider()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            /// Categories
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Top Categories', onSeeAll: () {}),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 98,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    CategoryChip(
                      label: 'Beverages',
                      imageUrl:
                      'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=200&q=80',
                    ),
                    CategoryChip(
                      label: 'Snack',
                      imageUrl:
                      'https://images.unsplash.com/photo-1521986329282-0436c1f1e212?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    CategoryChip(
                      label: 'Seafood',
                      imageUrl:
                      'https://images.unsplash.com/photo-1544025162-d76694265947?w=200&q=80',
                    ),
                    CategoryChip(
                      label: 'Dessert',
                      imageUrl:
                      'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?w=200&q=80',
                    ),
                    CategoryChip(
                      label: 'Fruits',
                      imageUrl:
                      'https://plus.unsplash.com/premium_photo-1671379041175-782d15092945?q=80&w=720&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            /// Top Discount Section
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Top Discount', onSeeAll: () {}),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      RestaurantCard(
                        title: 'Starbuck Borobudur',
                        distance: '1.0 km',
                        rating: 4.8,
                        imageUrl:
                        'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=800&q=80',
                      ),
                      SizedBox(width: 12),
                      RestaurantCard(
                        title: 'Baegopa Suhat',
                        distance: '500 m',
                        rating: 4.8,
                        imageUrl:
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&q=80',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onTrackPressed;

  const _TopBar({required this.onTrackPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.location_on_outlined,
                size: 20, color: Colors.green),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Current location',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                  ],
                ),
                const Text(
                  'Jl. Soekarno Hatta 15A...',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          /// Notification
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  tooltip: 'Notifications',
                  onPressed: onTrackPressed,
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search menu, restaurant or etc',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.tune),
            ),
          ],
        ),
      ),
    );
  }
}

/// Promo Slider
class _PromoSlider extends StatefulWidget {
  const _PromoSlider();

  @override
  State<_PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<_PromoSlider> {
  final PageController _controller = PageController();
  int _index = 0;

  final promos = const [
    PromoCard(
      imageUrl: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
      title: "Free Delivery",
      subtitle: "On all orders above \$20",
    ),
    PromoCard(
      imageUrl: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
      title: "50% Discount",
      subtitle: "Selected restaurants only",
    ),
    PromoCard(
      imageUrl: "https://images.unsplash.com/photo-1559925393-8be0ec4767c8",
      title: "Buy 1 Get 1",
      subtitle: "Weekend special deals",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: promos.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => promos[i],
          ),

          /// indicator bottom right
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
                  promos.length,
                      (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: _index == i ? 16 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _index == i
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
    );
  }
}
