import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/shared/shared.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: GestureDetector(
            onTap: () => context.pop(), child: Icon(AppIcons.closeX)),
      ),
    );
  }
}
