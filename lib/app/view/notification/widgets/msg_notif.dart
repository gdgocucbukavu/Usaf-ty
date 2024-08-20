import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/msg.dart';
import '../../../shared/shared.dart';

Container msgNotif(ThemeData theme) {
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
          'Messages',
          style: theme.textTheme.bodyMedium,
        ),
        const Gap(5),
        for (int i = 0; i < msgs.length; i++) ...{
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (msgs[i].isString)
                    ? Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.tdGrey,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(msgs[i].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(right: 10),
                      )
                    : (msgs[i].haveIcon)
                        ? Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: msgs[i].color.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            child: Icon(
                              msgs[i].icon,
                              color: msgs[i].color,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage(msgs[i].icon),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(right: 10),
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
                            msgs[i].name,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            DateFormat('HH:mm a').format(msgs[i].date),
                            style: theme.textTheme.labelMedium!.copyWith(
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        msgs[i].msg,
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
