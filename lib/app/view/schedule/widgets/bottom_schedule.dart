import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/schedule/widgets/tools.dart';

class BottomSchedule extends StatefulWidget {
  const BottomSchedule({super.key});

  @override
  State<BottomSchedule> createState() => _BottomScheduleState();
}

class _BottomScheduleState extends State<BottomSchedule> {
  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 0.95,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        padding: EdgeInsets.only(
          left: sizeWidth * 0.05,
          right: sizeWidth * 0.05,
          bottom: sizeWidth * 0.2,
        ),
        width: sizeWidth,
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(top: sizeWidth * 0.03),
            //       decoration: BoxDecoration(
            //         color: theme.primaryColorLight,
            //         borderRadius: BorderRadius.circular(100),
            //       ),
            //       width: sizeWidth * 0.25,
            //       height: sizeWidth * 0.01,
            //     ),
            //   ],
            // ),
            Gap(sizeWidth * 0.05),
            Text(
              'Horaire'.tr(),
              style: theme.textTheme.displaySmall,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                controller: scrollController,
                padding: EdgeInsets.only(top: sizeWidth * 0.06),
                itemBuilder: (context, int index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: sizeWidth * 0.2,
                          width: sizeWidth * 0.01,
                          color: AppColors.tdYellowB.withOpacity(0.3),
                        ),
                        Gap(sizeWidth * 0.05),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                (today.add(Duration(days: index)))
                                    .toString()
                                    .split(" ")[0],
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Gap(sizeWidth * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Agence : ".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.tdYellowB,
                                          fontWeight: FontWeight.bold,
                                          fontSize: sizeWidth * 0.03,
                                        ),
                                  ),
                                  Text(
                                    " --- ".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: sizeWidth * 0.025),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              Gap(sizeWidth * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Adresse : ".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.tdYellowB,
                                          fontWeight: FontWeight.bold,
                                          fontSize: sizeWidth * 0.03,
                                        ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.place),
                                      Gap(sizeWidth * 0.01),
                                      Text(
                                        "Av. ---/Q. ---/C. ---".tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: sizeWidth * 0.025),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Gap(sizeWidth * 0.02),
                  ],
                ),
                itemCount: getDaysDifference(),
                addSemanticIndexes: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
