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
    width: size,
    padding: EdgeInsets.all(size * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Système',
          style: theme.textTheme.bodyMedium,
        ),
        for (int i = 0; i < sytemMessages.length; i++) ...{
          Container(
            margin: EdgeInsets.only(top: size * 0.05),
            height: size * 0.15,
            width: size,
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
                  height: size * 0.1,
                  width: size * 0.1,
                  margin: EdgeInsets.only(right: size * 0.03),
                  child: (sytemMessages[i].icon != null)
                      ? Icon(
                          sytemMessages[i].icon,
                          color: sytemMessages[i].color,
                        )
                      : SizedBox(
                          width: size * 0.06,
                          height: size * 0.06,
                          child: Image.asset(sytemMessages[i].image),
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
                            style: theme.textTheme.bodyMedium
                                .copyWith(fontSize: size * 0.03),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            sytemMessages[i].time,
                            style: theme.textTheme.labelMedium
                                .copyWith(fontSize: size * 0.02),
                          ),
                        ],
                      ),
                      Text(
                        sytemMessages[i].msg,
                        style: theme.textTheme.bodySmall
                            .copyWith(fontSize: size * 0.025),
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
        Gap(size * 0.05),
      ],
    ),
  );
}
