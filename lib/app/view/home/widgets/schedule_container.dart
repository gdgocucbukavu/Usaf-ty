import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/schedule/widgets/tools.dart';

class ScheduleContainer extends StatefulWidget {
  const ScheduleContainer({super.key});

  @override
  State<ScheduleContainer> createState() => _ScheduleContainerState();
}

class _ScheduleContainerState extends State<ScheduleContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Aujourd'hui".tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.25,
              height: 120,
              margin: EdgeInsets.only(right: width * 0.01),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    daytoday.toString(),
                    style: theme.textTheme.displaySmall,
                  ),
                  Text(
                    getMonths(),
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColorDark,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Passage du car".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                    Divider(),
                    Text(
                      "Lieu :".tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.tdYellowB,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                    ),
                    Text(
                      "Av. ---/Q. ---/C. ---",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.tdGrey,
                            fontSize: 10,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "Agence :".tr(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.tdYellowB,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                        ),
                        Text(
                          " USAF'TY",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.tdGrey,
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
