import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/system_notif.dart';
import 'widgets/msg_notif.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            const Gap(10),
            const Icon(Icons.notifications_on_rounded),
            const Gap(50),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const Gap(20),
          systemNotif(theme),
          const Gap(20),
          msgNotif(theme),
          const Gap(20),
        ],
      ),
    );
  }
}
