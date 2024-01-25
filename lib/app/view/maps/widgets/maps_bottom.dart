import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(
        top: sizeHeight * 0.02,
        left: sizeHeight * 0.02,
        right: sizeHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: sizeHeight * 0.4,
      width: sizeWidth,
      child: Column(
        children: [
          Row(
            children: [
              Icon(AppIcons.car),
              Text('  ...  '),
              Text('23 km'),
            ],
          ),
        ],
      ),
    );
  }
}
