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
    final theme = Theme.of(context);
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        height: 50,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: theme.primaryColorLight,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                child: Row(
                  children: [
                    Icon(AppIcons.mapPin, size: 18),
                    const Gap(10),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          autocorrect: false,
                          autofillHints: const <String>[
                            AutofillHints.addressCity
                          ],
                          cursorColor: theme.primaryColorLight,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColorLight,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          onTapOutside: (event) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Rechercher une station'.tr(),
                            hintStyle: theme.textTheme.bodySmall!.copyWith(
                              color: theme.primaryColorLight,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Icon(AppIcons.search, size: 18),
                  ],
                ),
              ),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () => context.push(RoutePath.notification),
              child: notifIcon(
                theme,
                theme.scaffoldBackgroundColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
