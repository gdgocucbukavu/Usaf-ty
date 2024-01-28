import 'package:flutter/material.dart';

class Conseil extends StatelessWidget {
  static const route = '/conseil';
  const Conseil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Conseil d'utilisation",
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
