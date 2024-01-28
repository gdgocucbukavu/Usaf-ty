import 'package:flutter/material.dart';
import 'package:usaficity/app/view/schedule/widgets/table_calendar.dart';
import 'package:usaficity/app/view/schedule/widgets/bottom_schedule.dart';

// class ScheduleScreen extends StatelessWidget {
//   static const route = '/home';
//   const ScheduleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // dynamic sizeHeight = MediaQuery.sizeOf(context).height;
//     // dynamic sizeWidth = MediaQuery.sizeOf(context).width;
//     return  Scaffold(
//         resizeToAvoidBottomInset: false,backgroundColor: AppColors.tdGrey2,
//         body: Column(
//           children: [
//             TableCalendarr(),
//             Expanded(child:
//             BottomSchedule(),
//             )
//           ],
//         ));
//   }
// }
class ScheduleScreen extends StatefulWidget {
  static const route = '/schedule';

  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.9),
      body: Stack(
        children: [
          TableCalendarr(),
          BottomSchedule(),
        ],
      ),
    );
  }
}
