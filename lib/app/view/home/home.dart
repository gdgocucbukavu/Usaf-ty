import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/Upper_scroll_widget.dart';
import 'widgets/consigne_view.dart';
import 'widgets/header_page.dart';
import 'widgets/random_header_text.dart';
import 'widgets/schedule_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: sizeWidth * 0.12,
          left: sizeWidth * 0.05,
          right: sizeWidth * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPage(),
              Gap(sizeWidth * 0.02),
              HeaderTextPage(),
              Gap(sizeWidth * 0.02),
              UpperScrollwidget(),
              Gap(sizeWidth * 0.02),
              ScheduleContainer(),
              Gap(sizeWidth * 0.02),
              ConsigneView(),
              Gap(sizeWidth * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
