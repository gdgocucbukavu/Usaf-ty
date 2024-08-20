import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container stationView(
  ThemeData theme,
  Color color,
  String title,
  String adress,
) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: double.maxFinite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        stationIcon(color),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 10),
            ),
            Text(
              adress,
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 10),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    ),
  );
}

Container stationIcon(color) {
  return Container(
    alignment: Alignment.center,
    height: 45,
    width: 45,
    margin: EdgeInsets.only(right: 15, bottom: 5),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      border: Border.all(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Icon(
      CupertinoIcons.map_pin_ellipse,
      color: color,
      size: 20,
    ),
  );
}
