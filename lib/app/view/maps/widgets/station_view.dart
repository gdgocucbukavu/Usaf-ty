import 'package:flutter/cupertino.dart';

Container stationView(sizeWidth, theme, color, title, adress) {
  return Container(
    margin: EdgeInsets.only(top: sizeWidth * 0.04),
    width: sizeWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        stationIcon(sizeWidth, color),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium
                  .copyWith(fontSize: sizeWidth * 0.03),
            ),
            Text(
              adress,
              style: theme.textTheme.bodySmall
                  .copyWith(fontSize: sizeWidth * 0.025),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    ),
  );
}

Container stationIcon(sizeWidth, color) {
  return Container(
    alignment: Alignment.center,
    height: sizeWidth * 0.12,
    width: sizeWidth * 0.12,
    margin: EdgeInsets.only(right: sizeWidth * 0.05),
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
      size: sizeWidth * 0.05,
    ),
  );
}
