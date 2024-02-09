import 'package:flutter/material.dart';
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
    return Padding(
      padding: EdgeInsets.only(
          // top: sizeWidth * 0.12,
          // left: sizeWidth * 0.05,
          // right: sizeWidth * 0.05,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   alignment: Alignment.center,
          //   height: sizeHeight * 0.05,
          //   width: sizeHeight * 0.05,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image:
          //           AssetImage("${ProfilCubic.get(context).personnage.photoP}"),
          //     ),
          //     color: theme.scaffoldBackgroundColor.withOpacity(0.5),
          //     border: Border.all(
          //       color: theme.primaryColorLight,
          //       width: 1,
          //     ),
          //     borderRadius: BorderRadius.circular(100),
          //   ),
          // // ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.only(left: sizeWidth * 0.02),
          //     child: Text(
          //       "Bénédict LUBEMBELA",
          //       style: TextStyle(
          //           color: Theme.of(context).primaryColorDark,
          //           fontSize: 12,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Text.rich(TextSpan(
              text: "USAF",
              style: theme.textTheme.displayMedium.copyWith(fontSize: 40.0),
              children: [
                TextSpan(
                    text: "'",
                    style: theme.textTheme.displayMedium
                        .copyWith(color: AppColors.tdGrey, fontSize: 40.0)),
                TextSpan(
                    text: "TY",
                    style: theme.textTheme.displayMedium!
                        .copyWith(color: AppColors.tdYellowB, fontSize: 40.0)),
              ])),
          GestureDetector(
            onTap: () => context.push(RoutePath.notification),
            child: notifIcon(
              sizeHeight,
              theme,
              theme.scaffoldBackgroundColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
