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
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: sizeWidth * 0.05,
          right: sizeWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadView(
              contentName: contentName,
              contentMail: contentMail,
              contentImg: contentImg,
              isNetworkImg: isNetworkImg,
            ),
            Gap(sizeWidth * 0.05),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                top: sizeWidth * 0.15,
                left: sizeWidth * 0.05,
              ),
              width: sizeWidth,
              height: sizeWidth * 0.5,
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(sizeWidth * 0.05),
            Text(
              "Vue d'ensemble du contenu".tr(),
              style: theme.textTheme.displaySmall.copyWith(
                fontSize: sizeWidth * 0.04,
              ),
            ),
            Gap(sizeWidth * 0.03),
            Text(
              overview,
              style: theme.textTheme.bodyMedium.copyWith(
                fontSize: sizeWidth * 0.025,
              ),
              textAlign: TextAlign.justify,
            ),
            Gap(sizeWidth * 0.05),
            Padding(
              padding: EdgeInsets.only(right: sizeWidth * 0.1),
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
