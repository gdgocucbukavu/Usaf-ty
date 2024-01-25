import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:usaficity/app/shared/shared.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
        top: sizeHeight * 0.02,
        left: sizeHeight * 0.03,
        right: sizeHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: sizeHeight * 0.49,
      width: sizeWidth,
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: sizeHeight * 0.02),
        height: sizeHeight * 0.05,
        width: sizeWidth,
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
    );
  }
}
