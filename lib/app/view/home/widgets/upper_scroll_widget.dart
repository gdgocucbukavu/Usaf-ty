import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:usaficity/app/shared/shared.dart';

import '../../../../data/models/main_view.dart';

class UpperScrollwidget extends StatefulWidget {
  const UpperScrollwidget({super.key});

  @override
  State<UpperScrollwidget> createState() => _UpperScrollwidgetState();
}

class _UpperScrollwidgetState extends State<UpperScrollwidget> {
  late PageController pageController;
  dynamic currentIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: PageView.builder(
        reverse: false,
        controller: pageController,
        itemCount: mainview.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        pageSnapping: true,
        itemBuilder: (context, index) => Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.tdGrey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(mainview[index].img),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: ([0.3, 1.0]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'avec nous'.tr(),
                        style: TextStyle(
                          color: AppColors.tdWhite,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${mainview[index].title}'.tr(),
                          style: TextStyle(
                            color: AppColors.tdYellowB,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 2.5,
                          ),
                        ),
                        Text(
                          '${mainview[index].content}'.tr(),
                          style: TextStyle(
                            color: AppColors.tdWhite,
                            fontSize: 10,
                          ),
                        ),
                        const Gap(10),
                        ActivePage(
                          currentPage: currentIndex,
                          numberOfPage: mainview.length,
                        ),
                      ],
                    ),
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

class ActivePage extends StatelessWidget {
  ActivePage({
    super.key,
    required this.currentPage,
    required this.numberOfPage,
  });

  final int numberOfPage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numberOfPage,
        (index) => Container(
          height: (currentPage == index)
              ? MediaQuery.sizeOf(context).width * 0.02
              : MediaQuery.sizeOf(context).width * 0.01,
          width: (currentPage == index)
              ? MediaQuery.sizeOf(context).width * 0.02
              : MediaQuery.sizeOf(context).width * 0.01,
          decoration: BoxDecoration(
            color:
                (currentPage == index) ? AppColors.tdWhite : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.tdWhite,
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.01,
          ),
        ),
      ),
    );
  }
}
