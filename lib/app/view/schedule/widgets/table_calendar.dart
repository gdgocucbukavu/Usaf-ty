import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/schedule/widgets/tools.dart';

import '../../../routes/routes.dart';

class TableCalendarr extends StatefulWidget {
  const TableCalendarr({super.key});

  @override
  State<TableCalendarr> createState() => _TableCalendarrState();
}

class _TableCalendarrState extends State<TableCalendarr> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void selectedDay(DateTime day, DateTime focusedDay) {
      setState(() {
        today = day;
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.push(RoutePath.notification),
                  child: notifIcon(
                    theme,
                    theme.scaffoldBackgroundColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Gap(15),
            Text(
              "Aujourd'hui : ".tr(),
              style: theme.textTheme.displaySmall,
            ),
            const Gap(10),
            Text(
              DateTime.now().toString().split(" ")[0].tr(),
              style: theme.textTheme.displaySmall!.copyWith(
                fontSize: 12,
              ),
            ),
            Container(
              child: TableCalendar(
                onDaySelected: selectedDay,
                selectedDayPredicate: (day) => isSameDay(day, today),
                startingDayOfWeek: StartingDayOfWeek.monday,
                pageAnimationEnabled: true,
                pageAnimationDuration: Duration(milliseconds: 500),
                rowHeight: 48,
                daysOfWeekHeight: 45,
                calendarStyle: CalendarStyle(
                  weekendTextStyle: TextStyle(
                    color: AppColors.tdYellow,
                    fontSize: 11,
                  ),
                  outsideTextStyle: TextStyle(
                    color: AppColors.tdGrey.withOpacity(0.7),
                    fontSize: 11,
                  ),
                  defaultTextStyle: TextStyle(fontSize: 11),
                  selectedTextStyle: TextStyle(fontSize: 13),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.tdYellowB,
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 12,
                  ),
                  weekendStyle: theme.textTheme.titleSmall!.copyWith(
                    color: AppColors.tdYellowB,
                    fontSize: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tdGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: false,
                  titleTextStyle: TextStyle(fontSize: 13),
                  leftChevronMargin: EdgeInsets.all(0),
                  rightChevronMargin: EdgeInsets.all(0),
                ),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 10, 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
