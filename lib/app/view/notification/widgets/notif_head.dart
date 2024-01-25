import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/shared.dart';

Container notifHead(size, BuildContext context, theme) {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(
      top: size.width * 0.15,
      left: size.width * 0.05,
      bottom: size.width * 0.05,
    ),
    width: size.width * 0.67,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            AppIcons.closeX,
            size: size.width * 0.05,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification ',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const Icon(Icons.notifications_on_rounded),
          ],
        ),
      ],
    ),
  );
}
