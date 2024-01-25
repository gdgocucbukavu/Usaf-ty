import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

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
                (msgs[i].isGroup)
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.primaryColorLight,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        margin: EdgeInsets.only(right: size.width * 0.03),
                        child: Icon(
                          CupertinoIcons.person_2,
                          color: AppColors.tdGreenO,
                        ),
                      )
                    : (msgs[i].image == null)
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: theme.primaryColorLight,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            margin: EdgeInsets.only(right: size.width * 0.03),
                            child: Icon(
                              CupertinoIcons.person,
                              color: AppColors.tdBlue,
                            ),
                          )
                        : Container(
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
                            DateFormat('MMM dd à HH:mm a').format(msgs[i].date),
                            style: theme.textTheme.labelMedium,
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
