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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              HeaderPage(),
              const Gap(10),
              Expanded(
                child: ListView(
                  children: [
                    HeaderTextPage(),
                    const Gap(10),
                    UpperScrollwidget(),
                    const Gap(10),
                    ScheduleContainer(),
                    const Gap(10),
                    ConsigneView(),
                    const Gap(100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
