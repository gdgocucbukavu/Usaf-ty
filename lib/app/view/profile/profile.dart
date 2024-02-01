import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import 'widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<ProfilCubic, ProfilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                body: Stack(
              children: [
                Positioned(
                    top: sizeWidth * 0,
                    right: sizeWidth * 0.05,
                    child: NotificationBottom()),
                Positioned(
                    top: sizeWidth * 0.05,
                    child: Container(
                      width: sizeWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeadProfile(),
                          ControllerOptionButton(),
                          Divider(
                            height: 0.6,
                            color: AppColors.tdGrey,
                            indent: sizeWidth * 0.1,
                            endIndent: sizeWidth * 0.1,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          IconButtonFleche(),
                        ],
                      ),
                    ))
              ],
            )),
          );
        });
  }
}
