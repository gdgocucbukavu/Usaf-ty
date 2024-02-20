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
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: 230,
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
          width: sizeWidth,
          height: 230,
          margin: EdgeInsets.only(
            left: sizeWidth * 0.01,
            right: sizeWidth * 0.01,
          ),
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
                padding: EdgeInsets.all(sizeWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: sizeWidth * 0.15,
                      padding: EdgeInsets.all(sizeWidth * 0.01),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'avec nous',
                        style: TextStyle(
                          color: AppColors.tdWhite,
                          fontSize: sizeWidth * 0.015,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainview[index].title,
                          style: TextStyle(
                            color: AppColors.tdYellowB,
                            fontSize: sizeWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            height: 2.5,
                          ),
                        ),
                        Text(
                          mainview[index].content,
                          style: TextStyle(
                            color: AppColors.tdWhite,
                            fontSize: sizeWidth * 0.02,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Gap(10),
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
            color: (currentPage == index)
                ? Theme.of(context).primaryColorLight
                : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
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
