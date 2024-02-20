import 'package:flutter/material.dart';

import '../widgets/components.dart';

class Conseil extends StatelessWidget {
  static const route = '/conseil';
  const Conseil({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Conseil d'utilisation",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Container(
        width: sizeWidth * 0.90,
        height: sizeHeight * 0.98,
        margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
        child: ListView(
          children: [
            TextContainerForm(
                titre: "Déchets plastique",
                text:
                    "Voluptate aute nostrud eiusmod magna exercitation deserunt magna fugiat in sit non incididunt. Proident et adipisicing laborum eiusmod anim enim. Culpa est id sint labore et. In qui duis occaecat occaecat amet occaecat aute nisi ut exercitation labore proident sit."),
            TextContainerForm(
                titre: "Signalisation",
                text:
                    "Exercitation laborum elit ut voluptate velit. Exercitation aute amet quis fugiat non esse laborum excepteur enim. Anim laboris ullamco tempor aliqua proident proident in in minim in. Duis esse excepteur minim exercitation incididunt reprehenderit consequat amet magna proident ullamco quis. Duis culpa laborum commodo reprehenderit veniam consectetur amet enim aliqua adipisicing. Consequat do esse sint non excepteur."),
            TextContainerForm(
                titre: "S'informer",
                text:
                    "Commodo ut tempor sunt duis adipisicing ea Lorem reprehenderit eu consectetur do fugiat anim. Eiusmod nulla culpa dolor qui mollit nostrud consequat. Anim non voluptate eu sint reprehenderit pariatur veniam culpa aliquip non nisi exercitation amet. Magna esse cupidatat eiusmod culpa adipisicing culpa officia commodo sit occaecat sunt enim. Nulla dolore qui consequat laborum exercitation eu laboris occaecat sint sunt ullamco pariatur. Nostrud incididunt tempor commodo aute laboris do officia velit excepteur incididunt incididunt. Aute minim eiusmod excepteur fugiat aliqua eu pariatur ea excepteur mollit ut minim exercitation cillum.")
          ],
        ),
      ),
    );
  }
}
