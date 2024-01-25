import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/models/system_msg.dart';

Container systemNotif(theme, size) {
  return Container(
    decoration: BoxDecoration(
      color: theme.highlightColor,
      borderRadius: BorderRadius.circular(20),
    ),
    width: size.width,
    padding: EdgeInsets.all(size.width * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Système',
          style: theme.textTheme.bodyMedium,
        ),
        for (int i = 0; i < sytemMessages.length; i++) ...{
          Container(
            margin: EdgeInsets.only(top: size.width * 0.05),
            height: size.width * 0.15,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: sytemMessages[i].color.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  margin: EdgeInsets.only(right: size.width * 0.03),
                  child: Icon(
                    sytemMessages[i].icon,
                    color: sytemMessages[i].color,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sytemMessages[i].title,
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            sytemMessages[i].time,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Text(
                        sytemMessages[i].msg,
                        style: theme.textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        },
        Gap(size.width * 0.05),
      ],
    ),
  );
}
