import 'package:flutter/material.dart';
import '../widgets/components.dart';

class Privacy extends StatelessWidget {
  static const route = '/privacy';
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Politique d'utilisation",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Container(
        width: sizeWidth * 0.90,
        height: sizeHeight * 0.98,
        margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
        child: ListView(
          children: [
            TextContainerForm(
                titre: "Confidentialité",
                text:
                    "Aute id officia consectetur aliquip enim ullamco reprehenderit velit do quis occaecat amet sit. Id magna exercitation occaecat incididunt. Aute do tempor consectetur culpa non dolor culpa in est ad eu incididunt Lorem. Elit et officia elit nulla magna id labore aliquip ut officia amet voluptate non aliquip."),
            TextContainerForm(
                titre: "Politique d'utilisation",
                text:
                    "Voluptate do cupidatat aliquip ut deserunt tempor tempor mollit ad aliquip ullamco ex. Anim laboris eu enim laborum quis. Laboris laboris culpa incididunt irure do eiusmod sit amet excepteur occaecat consequat nisi duis. Voluptate proident veniam veniam non veniam enim sunt deserunt. Voluptate adipisicing adipisicing irure duis Lorem non ullamco elit amet. Consectetur dolore voluptate sint pariatur nostrud commodo veniam duis.\n\nMinim quis dolore nisi in nulla aliquip enim ex do duis excepteur. Ea culpa cillum labore ullamco ullamco excepteur velit commodo. Do do reprehenderit cupidatat eu consectetur nostrud ullamco amet in non ipsum mollit excepteur nostrud. Amet proident labore elit eu reprehenderit quis qui commodo ad. Et Lorem mollit fugiat esse Lorem velit nulla anim consectetur. Qui non sint officia non labore.")
          ],
        ),
      ),
    );
  }
}
