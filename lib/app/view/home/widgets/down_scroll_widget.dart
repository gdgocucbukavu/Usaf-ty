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
        height: MediaQuery.of(context).size.height * 0.3,
        width: 1000,
        child: ListView.builder(
          physics: PageScrollPhysics(),
          itemBuilder: (context, index) => Container(
              width: sizeWidth*0.9,
              height: sizeHeight*0.01,
              margin: EdgeInsets.only(left: sizeWidth*0.02, right: sizeWidth*0.02, bottom: sizeHeight*0.09),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gestion des déchets plastiques ",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Divider(color: Theme.of(context).primaryColorDark),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: sizeWidth * 0.6,
                            child: Text(
                              "La gestion des déchets plastiques doit se faire de façon à ce qu'ils puissent être recyclés sans aucun soucis... ",
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.justify,
                            )),
                        Expanded(
                            child: Image(
                          image: AssetImage(
                            "assets/images/greenpoub.png",
                          ),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ))
                      ],
                    ),
                  ],
                ),
              )),
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
