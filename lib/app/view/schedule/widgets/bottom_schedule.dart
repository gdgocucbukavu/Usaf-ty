import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/schedule/widgets/tools.dart';

class BottomSchedule extends StatefulWidget {
  const BottomSchedule({super.key});

  @override
  State<BottomSchedule> createState() => _BottomScheduleState();
}

class _BottomScheduleState extends State<BottomSchedule> {
  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        snap: true,
        snapAnimationDuration: Duration(milliseconds: 100),
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
                padding: EdgeInsets.only(
                  top: sizeHeight * 0.03,
                  left: sizeHeight * 0.03,
                  right: sizeHeight * 0.03,
                ),
                height: sizeHeight * 0.4,
                width: sizeWidth,
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      padding: EdgeInsets.only(top: sizeHeight*0.06),
                      itemBuilder: (context, int index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: sizeHeight * 0.07,
                                width: sizeWidth * 0.01,
                                color: AppColors.tdBlue,
                              ),
                              SizedBox(
                                width: sizeWidth * 0.03,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      today.toString().split(" ")[0],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    SizedBox(
                                      height: sizeHeight * 0.02,
                                    ),
                                    Text("Pas d'evénement aujourd'hui"),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: sizeHeight * 0.02,
                          ),
                        ],
                      ),
                      itemCount: 100,
                      addSemanticIndexes: true,
                    ),
                    Container(
                      height: sizeHeight * 0.06,
                      width: double.infinity,
                      color: theme.scaffoldBackgroundColor,
                      child: Text(
                        'Horaire',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                )));
  }
}
