import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/notif_body.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification '.tr(),
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Gap(size * 0.03),
            const Icon(Icons.notifications_on_rounded),
            Gap(size * 0.1),
          ],
        ),
      ),
      body: notifBody(theme, size),
    );
  }
}
