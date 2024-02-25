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
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    void selectedDay(DateTime day, DateTime focusedDay) {
      setState(() {
        today = day;
      });
    }

    return Padding(
      padding: EdgeInsets.only(
        top: sizeWidth * 0.12,
        left: sizeWidth * 0.05,
        right: sizeWidth * 0.05,
      ),
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
                  sizeHeight,
                  theme,
                  theme.scaffoldBackgroundColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Gap(sizeWidth * 0.05),
          Text(
            "Aujourd'hui : ".tr(),
            style: theme.textTheme.displaySmall,
          ),
          Gap(sizeWidth * 0.02),
          Text(
            DateTime.now().toString().split(" ")[0].tr(),
            style: theme.textTheme.displaySmall.copyWith(
              fontSize: sizeWidth * 0.05,
            ),
          ),
          Container(
            child: TableCalendar(
              onDaySelected: selectedDay,
              selectedDayPredicate: (day) => isSameDay(day, today),
              startingDayOfWeek: StartingDayOfWeek.monday,
              pageAnimationEnabled: true,
              pageAnimationDuration: Duration(milliseconds: 500),
              rowHeight: sizeHeight * 0.06,
              daysOfWeekHeight: 30,
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(color: AppColors.tdGrey),
                outsideTextStyle: TextStyle(
                  color: AppColors.tdGrey.withOpacity(0.5),
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.tdYellowB,
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: theme.textTheme.titleMedium,
                weekendStyle: TextStyle(color: AppColors.tdYellowB),
                decoration: BoxDecoration(
                  color: AppColors.tdGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: false,
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
    );
  }
}
