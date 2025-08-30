import 'package:flutter/material.dart';
import 'package:freshgo/features/home/presentation/home_screen.dart';
import 'package:freshgo/features/order_tracking/presentation/order_tracking_screen.dart';

class NavItem {
  final String label;
  final Icon icon;
  final Icon selectedIcon;
  final Widget screen;

  const NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.screen,
  });
}

class BottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNavScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int _selectedIndex;

  // Helper function for placeholder screens
  Widget _placeholderScreen(String label) => Center(
    child: Text(
      '$label Screen',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  late final List<NavItem> _navItems = [
    NavItem(
      label: 'Home',
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home),
      screen: const HomeScreen(),
    ),
    NavItem(
      label: 'Orders',
      icon: const Icon(Icons.shopping_bag_outlined),
      selectedIcon: const Icon(Icons.shopping_bag),
      screen: OrderTrackingScreen(),
    ),
    NavItem(
      label: 'Bookmark',
      icon: const Icon(Icons.bookmark_outline),
      selectedIcon: const Icon(Icons.bookmark),
      screen: _placeholderScreen('Bookmark'),
    ),
    NavItem(
      label: 'Profile',
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      screen: _placeholderScreen('Profile'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onNavItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _navItems.map((item) => item.screen).toList(),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? const TextStyle(fontWeight: FontWeight.w600, color: Colors.green)
                : const TextStyle(color: Colors.grey);
          }),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? const IconThemeData(color: Colors.green, size: 28)
                : const IconThemeData(color: Colors.grey, size: 24);
          }),
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onNavItemTapped,
          destinations: _navItems
              .map((item) => NavigationDestination(
            icon: item.icon,
            selectedIcon: item.selectedIcon,
            label: item.label,
          ))
              .toList(),
        ),
      ),
    );
  }
}
