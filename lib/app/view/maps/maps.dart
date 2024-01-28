import 'package:flutter/material.dart';

import 'widgets/maps_bottom.dart';
import 'widgets/maps_view.dart';
import 'widgets/search_view.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          MapsView(),
          SearchView(),
          BottomView(),
        ],
      ),
    );
  }
}
