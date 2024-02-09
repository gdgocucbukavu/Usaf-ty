import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/home/widgets/Upper_scroll_widget.dart';
import 'package:usaficity/app/view/home/widgets/down_scroll_widget.dart';
import 'package:usaficity/app/view/home/widgets/header_page.dart';
import 'package:usaficity/app/view/home/widgets/random_header_text.dart';
import 'package:usaficity/app/view/home/widgets/schedule_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: EdgeInsets.only(
            top: sizeWidth * 0.12,
            left: sizeWidth * 0.05,
            right: sizeWidth * 0.05,
          ),
          child: Column(children: [
            HeaderPage(),
            SizedBox(height: sizeHeight * 0.02),
            HeaderTextPage(),
            SizedBox(height: sizeHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.place,
                  size: 15,
                ),
                Text(
                  "Av. Fizi/Q. Ndendere/C. Ibanda",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: sizeHeight * 0.005),
            UpperScrollwidget(),
            SizedBox(height: sizeHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: sizeHeight * 0.025,
                  width: sizeWidth * 0.01,
                  color: AppColors.tdBlue,
                ),
                SizedBox(
                  width: sizeWidth * 0.01,
                ),
                Text(
                  "Aujourd'hui",
                  style: TextStyle(
                      color: AppColors.tdBlueC,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: sizeHeight * 0.01),
            ScheduleContainer(),
            SizedBox(height: sizeHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: sizeHeight * 0.025,
                  width: sizeWidth * 0.01,
                  color: AppColors.tdBlue,
                ),
                SizedBox(
                  width: sizeWidth * 0.01,
                ),
                Text(
                  "Consignes",
                  style: TextStyle(
                      color: AppColors.tdBlueC,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: sizeHeight * 0.01),
            DownScrollwidget(),
          ])),
    );
  }
}
