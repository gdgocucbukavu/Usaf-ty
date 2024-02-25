import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'msg_notif.dart';
import 'system_notif.dart';

Container notifBody(theme, size) {
  return Container(
    alignment: Alignment.topCenter,
    color: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: size * 0.03),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(size * 0.05),
          systemNotif(theme, size),
          msgNotif(theme, size),
        ],
      ),
    ),
  );
}
