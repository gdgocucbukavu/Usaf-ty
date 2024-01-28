import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  static const route = '/privacy';
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Confidentialité et Politique",
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
