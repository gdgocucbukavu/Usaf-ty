import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/system_msg.dart';

Container systemNotif(ThemeData theme) {
  return Container(
    decoration: BoxDecoration(
      color: theme.highlightColor,
      borderRadius: BorderRadius.circular(20),
    ),
    width: double.maxFinite,
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Système',
          style: theme.textTheme.bodyMedium,
        ),
        const Gap(5),
        for (int i = 0; i < sytemMessages.length; i++) ...{
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            height: 50,
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
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  child: (sytemMessages[i].icon != null)
                      ? Icon(
                          sytemMessages[i].icon,
                          color: sytemMessages[i].color,
                        )
                      : SizedBox(
                          width: 40,
                          height: 40,
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
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            sytemMessages[i].time,
                            style: theme.textTheme.labelMedium!.copyWith(
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        sytemMessages[i].msg,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                        ),
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
      ],
    ),
  );
}
