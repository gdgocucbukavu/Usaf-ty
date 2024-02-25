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
    monthtoday = DateTime.now().month;
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Aujourd'hui".tr(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(sizeHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: sizeWidth * 0.25,
              height: sizeWidth * 0.3,
              margin: EdgeInsets.only(right: sizeWidth * 0.01),
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
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: sizeWidth * 0.3,
                padding: EdgeInsets.symmetric(
                  vertical: sizeHeight * 0.02,
                  horizontal: sizeHeight * 0.015,
                ),
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColorDark,
                      endIndent: 20,
                    ),
                    Text(
                      "Lieu :".tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.tdYellowB,
                            fontWeight: FontWeight.bold,
                            fontSize: sizeWidth * 0.03,
                          ),
                    ),
                    Text(
                      "Av. ---/Q. ---/C. ---",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.tdGrey,
                            fontSize: sizeWidth * 0.025,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeWidth * 0.03,
                                  ),
                        ),
                        Text(
                          "USAF'TY",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.tdGrey,
                                    fontSize: sizeWidth * 0.025,
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
