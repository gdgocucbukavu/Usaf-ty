import 'package:flutter/material.dart';

import '../shared.dart';

SnackBar customSnackBar(context, text) {
  return SnackBar(
    backgroundColor: Theme.of(context).primaryColorDark.withOpacity(0.5),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).width * 0.05,
          width: MediaQuery.sizeOf(context).width * 0.05,
          margin:
              EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.02),
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).highlightColor,
              style: BorderStyle.solid,
              width: 0.5,
            ),
            image: DecorationImage(
              image: AssetImage(AppImages.logol),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).highlightColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
