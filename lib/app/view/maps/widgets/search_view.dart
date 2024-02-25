import 'package:easy_localization/easy_localization.dart';
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
    return Container(
      width: sizeWidth,
      padding: EdgeInsets.only(
        top: sizeWidth * 0.12,
        left: sizeWidth * 0.05,
        right: sizeWidth * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
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
                        hintText: 'Rechercher une station'.tr(),
                      ),
                    ),
                  ),
                  Icon(AppIcons.search),
                ],
              ),
            ),
          ),
          Gap(sizeWidth * 0.01),
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
