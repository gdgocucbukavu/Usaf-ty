import 'package:flutter/cupertino.dart';

Container stationView(sizeHeight, sizeWidth, theme, color, title, adress) {
  return Container(
    margin: EdgeInsets.only(top: sizeHeight * 0.02),
    width: sizeWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        stationIcon(sizeHeight, color),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium
                  .copyWith(fontSize: sizeHeight * 0.015),
            ),
            Text(
              adress,
              style: theme.textTheme.bodySmall
                  .copyWith(fontSize: sizeHeight * 0.012),
            ),
          ],
        ),
      ],
    ),
  );
}

Container stationIcon(sizeHeight, color) {
  return Container(
    alignment: Alignment.center,
    height: sizeHeight * 0.05,
    width: sizeHeight * 0.05,
    margin: EdgeInsets.only(right: sizeHeight * 0.03),
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
    ),
  );
}
