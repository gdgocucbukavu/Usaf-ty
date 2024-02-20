import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/routes/routes.path.dart';
import 'package:usaficity/app/shared/shared.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({super.key});

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    // dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => context.push(RoutePath.notification),
              child: notifIcon(
                sizeHeight,
                theme,
                theme.scaffoldBackgroundColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
        Gap(sizeHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: "Usaf",
                style: theme.textTheme.displayMedium.copyWith(fontSize: 40.0),
                children: [
                  TextSpan(
                    text: "'",
                    style: theme.textTheme.displayMedium.copyWith(
                      color: AppColors.tdGrey,
                      fontSize: 40.0,
                    ),
                  ),
                  TextSpan(
                    text: "ty",
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: AppColors.tdYellowB,
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
