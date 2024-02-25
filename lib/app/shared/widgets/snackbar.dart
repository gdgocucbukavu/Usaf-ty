import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../shared.dart';

SnackBar customSnackBar(context, String text) {
  return SnackBar(
    backgroundColor: Theme.of(context).primaryColorDark,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: MediaQuery.sizeOf(context).width * 0.05,
      vertical: MediaQuery.sizeOf(context).width * 0.03,
    ),
    behavior: SnackBarBehavior.floating,
    content: Container(
      height: MediaQuery.sizeOf(context).width * 0.05,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.07,
            child: Text(
              text.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).highlightColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).width * 0.05,
            width: MediaQuery.sizeOf(context).width * 0.05,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).highlightColor,
                style: BorderStyle.solid,
                width: 0.5,
              ),
              image: DecorationImage(
                image: AssetImage(AppImages.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
