import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static dynamic route = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ProfileScreen'),
      ),
    );
  }
}
