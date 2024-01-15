import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  static const route = '/home';
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("MapsScreen"),
      ),
    );
  }
}