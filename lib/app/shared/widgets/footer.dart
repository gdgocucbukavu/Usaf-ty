import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../shared.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(image: AssetImage(AppImages.gdsclogo)),
            ),
          ),
          const Gap(10),
          Text(
            'Développé par GDSC-UCB®'.tr(),
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 9),
            textAlign: TextAlign.center,
          ),
          const Gap(5),
          Text(
            '©2024 Tous droits réservés'.tr(),
            style: theme.textTheme.labelMedium!.copyWith(fontSize: 8),
            textAlign: TextAlign.center,
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
