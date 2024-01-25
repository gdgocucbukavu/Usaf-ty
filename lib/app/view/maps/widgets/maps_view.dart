import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';
import '../../../shared/shared.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: sizeHeight,
      width: sizeWidth,
      child: Stack(
        children: [
          Container(color: AppColors.tdGrey),
          Padding(
            padding: EdgeInsets.only(
              top: sizeWidth * 0.12,
              left: sizeWidth * 0.05,
              right: sizeWidth * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.push(RoutePath.notification),
                  child: notifIcon(sizeHeight, theme),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
