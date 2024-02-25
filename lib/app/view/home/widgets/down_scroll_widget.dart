import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DownScrollwidget extends StatefulWidget {
  const DownScrollwidget({super.key});

  @override
  State<DownScrollwidget> createState() => _DownScrollwidgetState();
}

late PageController pageController;

class _DownScrollwidgetState extends State<DownScrollwidget> {
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.only(top: sizeHeight * 0.02),
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomContainer(sizeWidth: sizeWidth, sizeHeight: sizeHeight),
                BottomContainer(sizeWidth: sizeWidth, sizeHeight: sizeHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.sizeWidth,
    required this.sizeHeight,
  });

  final sizeWidth;
  final sizeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth * 0.43,
      height: sizeHeight * 0.19,
      margin: EdgeInsets.only(
          left: sizeWidth * 0.02,
          right: sizeWidth * 0.02,
          bottom: sizeHeight * 0.00),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     offset: const Offset(0, 5),
        //     blurRadius: 5,
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Déchets plastiques ".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Divider(color: Theme.of(context).primaryColorDark),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeHeight * 0.1,
                  width: sizeWidth * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recyclage".tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "Ecologie".tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "Recréation".tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "Réusage".tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Image(
                  image: AssetImage(
                    "assets/images/greenpoub.png",
                  ),
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
