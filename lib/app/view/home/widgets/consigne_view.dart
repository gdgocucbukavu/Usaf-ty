import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

import '../../../../data/models/consigne.dart';
import '../../../shared/shared.dart';
import '../page/consigne_detail.dart';

class ConsigneView extends StatefulWidget {
  const ConsigneView({super.key});

  @override
  State<ConsigneView> createState() => _ConsigneViewState();
}

class _ConsigneViewState extends State<ConsigneView> {
  int currentPage = 0;
  @override
  initState() {
    currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Consignes & Conseils".tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.transparent,
            child: ListWheelScrollViewX(
              scrollDirection: Axis.horizontal,
              itemExtent: MediaQuery.sizeOf(context).width * 0.9,
              diameterRatio: 3,
              onSelectedItemChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: List.generate(
                consignes.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConsigneDetail(
                            contentImg: consignes[index].img,
                            contentName: consignes[index].name,
                            contentMail: consignes[index].mail,
                            img: consignes[index].bckImg,
                            overview: consignes[index].content,
                            isNetworkImg:
                                consignes[index].img == '' ? false : true,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: (consignes[index].img == '')
                                        ? BoxDecoration(
                                            color: AppColors.tdGrey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  theme.scaffoldBackgroundColor,
                                              style: BorderStyle.solid,
                                              width: 1,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(AppImages.logo),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : BoxDecoration(
                                            color: AppColors.tdGrey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  theme.scaffoldBackgroundColor,
                                              style: BorderStyle.solid,
                                              width: 1,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                consignes[index].img,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            consignes[index].name,
                                            style: GoogleFonts.poppins(
                                              color: theme.primaryColorLight,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2,
                                              fontSize: 12,
                                              height: 1.5,
                                            ),
                                          ),
                                          Icon(
                                            (consignes[index].img == '')
                                                ? CupertinoIcons.lightbulb
                                                : CupertinoIcons.light_max,
                                            color: theme.primaryColorLight,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        consignes[index].mail,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.tdGrey,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5,
                                          fontSize: 10,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Text(
                                consignes[index].content,
                                style: GoogleFonts.poppins(
                                  color: theme.primaryColorDark,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5,
                                  fontSize: 9,
                                  height: 1.8,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          if (consignes[index].img != '')
                            Icon(
                              CupertinoIcons.signature,
                              color: theme.primaryColorDark,
                              size: 15,
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ActivePage(
            currentPage: currentPage,
            numberOfPage: consignes.length,
          ),
        ],
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
