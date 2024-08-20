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
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 0.95,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          width: double.maxFinite,
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
              Text(
                'Horaire'.tr(),
                style: theme.textTheme.displaySmall,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 4,
                            height: 70,
                            color: AppColors.tdYellowB.withOpacity(0.3),
                          ),
                          const Gap(15),
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
                                const Gap(5),
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
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                          ),
                                    ),
                                    Text(
                                      " --- ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 11),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                const Gap(5),
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
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                          ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.place, size: 15),
                                        const Gap(5),
                                        Text(
                                          "Av. ---/Q. ---/C. ---",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 11),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                    ],
                  ),
                  itemCount: getDaysDifference(),
                  addSemanticIndexes: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
