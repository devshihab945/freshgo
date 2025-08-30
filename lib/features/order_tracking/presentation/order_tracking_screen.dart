import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final points = const [
    LatLng(-7.9511, 112.6145),
    LatLng(-7.9520, 112.6160),
    LatLng(-7.9535, 112.6173),
    LatLng(-7.9540, 112.6190),
  ];

  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: points.last,
              initialZoom: 15.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'freshgo_app',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: points,
                    color: const Color(0xFF22C55E),
                    strokeWidth: 6,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: points.first,
                    width: 44,
                    height: 44,
                    child: const _AvatarMarker(name: 'S', color: Colors.orange),
                  ),
                  Marker(
                    point: points.last,
                    width: 44,
                    height: 44,
                    child:
                        const _AvatarMarker(name: 'R', color: Colors.blueGrey),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const _BottomOrderSheet(),
        ],
      ),
    );
  }
}

class _AvatarMarker extends StatelessWidget {
  final String name;
  final Color color;

  const _AvatarMarker({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        child: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _BottomOrderSheet extends StatelessWidget {
  final items = const [
    ['Caramel Macchiato', '1 x', '\$12'],
    ['Greentea Latte', '1 x', '\$10'],
    ['Egg Mayo Sandwich', '2 x', '\$30'],
  ];

  const _BottomOrderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(blurRadius: 16, spreadRadius: 4, color: Color(0x1A000000))
          ],
        ),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).padding.bottom + 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF34D399), Color(0xFF22C55E)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  SizedBox(width: 16),
                  Text('Coupon name', style: TextStyle(color: Colors.white70)),
                  Spacer(),
                  Text('DISCWITHSTARBUCK',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Text('Delivery time',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(width: 8),
                Icon(Icons.access_time, size: 18, color: Colors.green),
                SizedBox(width: 6),
                Text('30 minutes'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Food items',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                Text('+  Add item',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(e[0])),
                    Text(e[1]),
                    const SizedBox(width: 12),
                    Text(e[2],
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
