import 'package:flutter/material.dart';

import 'widgets/notif_body.dart';
import 'widgets/notif_head.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.sizeOf(context);
    dynamic theme = Theme.of(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notifHead(size, context, theme),
            Expanded(child: notifBody(theme, size)),
          ],
        ),
      ),
    );
  }
}
