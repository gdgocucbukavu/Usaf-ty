import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Apropos", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Stack(
        children: [
          Positioned(
              top: sizeWidth * 0.08,
              child: Container(
                width: sizeWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: sizeWidth * 0.24,
                        height: sizeWidth * 0.24,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("${AppImages.logo}"),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3,
                                color: AppColors.tdGrey,
                                style: BorderStyle.solid))),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Usaf'ty",
                        style: Theme.of(context).textTheme.displaySmall),
                    SizedBox(
                      height: 3,
                    ),
                    Text("GDSC-UCB",
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: sizeWidth * 0.07),
                        width: sizeWidth,
                        child: Text(
                          "Usaf'ty est une solution réalisez par la communinauté universitaire GDSC, une solution qui sert à la gestion de déchet dans la ville.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: sizeWidth * 0.1,
              child: Container(
                width: sizeWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "copyright 2024 GDSC",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
