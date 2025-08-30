import 'package:flutter/material.dart';

class FreshGoApp extends StatelessWidget {
  const FreshGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshGo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to FreshGo!'),
        ),
      ),
    );
  }
}
