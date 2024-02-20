import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

import '../../../../data/models/consigne.dart';
import '../../../shared/shared.dart';

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
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.transparent,
      width: sizeWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Consignes & Conseils",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(sizeWidth * 0.005),
          Container(
            height: sizeWidth * 0.45,
            color: Colors.transparent,
            child: ListWheelScrollViewX(
              scrollDirection: Axis.horizontal,
              itemExtent: sizeWidth * 0.9,
              diameterRatio: 3,
              onSelectedItemChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: List.generate(
                consignes.length,
                (index) {
                  return Container(
                    height: sizeWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
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
                                  decoration: BoxDecoration(
                                    color: AppColors.tdGrey,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: AppColors.tdGrey,
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        consignes[index].img,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 45,
                                  width: 45,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          consignes[index].name,
                                          style: GoogleFonts.poppins(
                                            color: theme.highlightColor,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width /
                                                30,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                            height: 1.5,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.quote_bubble,
                                          color: theme.highlightColor,
                                          size:
                                              MediaQuery.sizeOf(context).width /
                                                  22,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      consignes[index].profession,
                                      style: GoogleFonts.poppins(
                                        color: AppColors.tdGrey,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width /
                                                50,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Clarity.block_quote_line,
                                  color: theme.highlightColor,
                                  size: MediaQuery.sizeOf(context).width / 22,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      left: 5,
                                      right: 15,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          consignes[index].content,
                                          style: GoogleFonts.poppins(
                                            color: theme.highlightColor,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.02,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: 1.5,
                                            height: 1.8,
                                          ),
                                          softWrap: true,
                                          textAlign: TextAlign.justify,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          CupertinoIcons.signature,
                          color: theme.highlightColor,
                          size: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                      ],
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