import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/routes/routes.path.dart';
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
    return GestureDetector(
      onTap: () => context.push(RoutePath.schedule),
      child: Padding(
        padding: EdgeInsets.only(
            top: sizeHeight * 0.01,
            bottom: sizeHeight * 0.01,
            left: sizeWidth * 0.02,
            right: sizeWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: sizeHeight * 0.16,
              width: sizeWidth * 0.25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(sizeHeight * 0.035),
                  bottomLeft: Radius.circular(sizeHeight * 0.035),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      daytoday.toString(),
                      style: theme.textTheme.displayLarge,
                    ),
                    Text(
                      getMonths(),
                      style: theme.textTheme.titleLarge,
                    ),
                  ]),
            ),
            SizedBox(
              width: sizeWidth * 0.01,
            ),
            Expanded(
              child: Container(
                height: sizeHeight * 0.16,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: sizeHeight * 0.01,
                      bottom: sizeHeight * 0.01,
                      left: sizeWidth * 0.02,
                      right: sizeWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Passage du car",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 24.0),
                      ),
                      Divider(
                          height: sizeHeight * 0.03,
                          color: Theme.of(context).primaryColorDark,
                          endIndent: sizeWidth * 0.06),
                      Expanded(
                        child: SizedBox(
                            // height: 20,
                            width: 200,
                            child: Text.rich(TextSpan(
                                text: "Lieu: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.tdYellowB,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                children: [
                                  TextSpan(
                                    text: "Av. Fizi/Q. Ndendere/C. Ibanda",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.tdGrey),
                                  )
                                ]))),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
