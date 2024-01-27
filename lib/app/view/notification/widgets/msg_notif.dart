import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/msg.dart';
import '../../../shared/shared.dart';

Container msgNotif(theme, size) {
  return Container(
    decoration: BoxDecoration(
      color: theme.highlightColor,
      borderRadius: BorderRadius.circular(20),
    ),
    width: size.width,
    margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
    padding: EdgeInsets.all(size.width * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Messages',
          style: theme.textTheme.bodyMedium,
        ),
        for (int i = 0; i < msgs.length; i++) ...{
          Container(
            margin: EdgeInsets.only(top: size.width * 0.05),
            height: size.width * 0.15,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (msgs[i].isString)
                    ? Container(
                        alignment: Alignment.center,
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.tdGrey,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(msgs[i].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(right: size.width * 0.03),
                      )
                    : (msgs[i].haveIcon)
                        ? Container(
                            alignment: Alignment.center,
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                              color: msgs[i].color.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(right: size.width * 0.03),
                            child: Icon(
                              msgs[i].icon,
                              color: msgs[i].color,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage(msgs[i].icon),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            margin: EdgeInsets.only(right: size.width * 0.03),
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
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            DateFormat('HH:mm a').format(msgs[i].date),
                            style: theme.textTheme.labelMedium
                                .copyWith(fontSize: size.width * 0.02),
                          ),
                        ],
                      ),
                      Text(
                        msgs[i].msg,
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
