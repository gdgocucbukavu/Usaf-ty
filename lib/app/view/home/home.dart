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
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.highlightColor.withOpacity(0.9),
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
              Gap(sizeHeight * 0.01),
              HeaderTextPage(),
              Gap(sizeHeight * 0.01),
              UpperScrollwidget(),
              Gap(sizeHeight * 0.02),
              ScheduleContainer(),
              Gap(sizeHeight * 0.02),
              ConsigneView(),
            ],
          ),
        ),
      ),
    );
  }
}
