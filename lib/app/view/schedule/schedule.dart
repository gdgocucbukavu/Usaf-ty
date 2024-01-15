import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  static const route = '/home';
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ScheduleScreen"),
      ),
    );
  }
}
