import 'package:flutter/material.dart';

import 'widgets/maps_bottom.dart';
import 'widgets/mapsview.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SizedBox(
        height: sizeHeight,
        width: sizeWidth,
        child: Stack(
          children: [
            MapsView(),
            Positioned(
              bottom: 0,
              child: BottomView(),
            ),
          ],
        ),
      ),
    );
  }
}
