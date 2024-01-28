import 'package:flutter/material.dart';

class SignalPage extends StatelessWidget {
  static const route = '/signaler';
  const SignalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Signalisation",
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
