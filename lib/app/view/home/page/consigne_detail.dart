import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/headview.dart';

class ConsigneDetail extends StatelessWidget {
  final img;
  final overview;
  final contentName;
  final contentMail;
  final contentImg;
  final bool isNetworkImg;

  const ConsigneDetail({
    super.key,
    required this.img,
    required this.overview,
    required this.contentName,
    required this.contentMail,
    required this.contentImg,
    required this.isNetworkImg,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadView(
              contentName: contentName,
              contentMail: contentMail,
              contentImg: contentImg,
              isNetworkImg: isNetworkImg,
            ),
            const Gap(20),
            Container(
              alignment: Alignment.topLeft,
              width: double.maxFinite,
              height: 200,
              padding: const EdgeInsets.only(top: 10, left: 20),
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(20),
            Text(
              "Vue d'ensemble du contenu".tr(),
              style: theme.textTheme.displaySmall!.copyWith(
                fontSize: 15,
              ),
            ),
            const Gap(10),
            Text(
              overview,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 11,
              ),
              textAlign: TextAlign.justify,
            ),
            const Gap(10),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(CupertinoIcons.signature),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
