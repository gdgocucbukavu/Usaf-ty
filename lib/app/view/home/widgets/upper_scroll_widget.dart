import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/home/widgets/tools.dart';

class UpperScrollwidget extends StatefulWidget {
  const UpperScrollwidget({super.key});

  @override
  State<UpperScrollwidget> createState() => _UpperScrollwidgetState();
}

late PageController pageController;

class _UpperScrollwidgetState extends State<UpperScrollwidget> {
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: sizeHeight * 0.2,
      width: sizeWidth * 0.9,
      child: PageView.builder(
        controller: pageController,
        itemCount: imageslist.length,
        reverse: false,
        itemBuilder: (context, index) => AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              return Transform.translate(
                offset: Offset(2, 0),
                child: Container(
                  margin: EdgeInsets.only(
                      left: sizeWidth * 0.01,
                      right: sizeWidth * 0.01,
                      bottom: sizeHeight * 0.00),
                  decoration: BoxDecoration(
                    color: AppColors.tdGrey,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.tdGrey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("${imageslist[index]}"),
                          alignment: Alignment(-pageOffset.abs(), 0),
                          fit: BoxFit. contain),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
