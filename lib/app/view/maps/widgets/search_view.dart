import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/shared/shared.dart';

import '../../../routes/routes.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
        top: sizeWidth * 0.12,
        left: sizeWidth * 0.03,
        right: sizeWidth * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: theme.primaryColorLight,
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: sizeHeight * 0.02),
            height: sizeHeight * 0.05,
            width: sizeWidth * 0.8,
            child: Row(
              children: [
                Icon(AppIcons.mapPin),
                Gap(sizeWidth * 0.05),
                Expanded(
                  child: TextField(
                    autocorrect: false,
                    autofillHints: const <String>[AutofillHints.addressCity],
                    cursorColor: theme.primaryColorLight,
                    style: theme.textTheme.bodyMedium,
                    maxLines: null,
                    onTapOutside: (event) =>
                        FocusScope.of(context).requestFocus(FocusNode()),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Rechercher une station',
                    ),
                  ),
                ),
                Icon(AppIcons.search),
              ],
            ),
          ),
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
    );
  }
}
