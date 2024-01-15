import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static String route = '/auth';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AuthSreen')),
    );
  }
}
