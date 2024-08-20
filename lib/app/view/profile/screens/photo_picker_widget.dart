import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../shared/shared.dart';

class PhotoPickerWidget extends StatelessWidget {
  const PhotoPickerWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final font = theme.textTheme.bodyMedium;
    final cubit = ProfilCubit.get(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          height: 200,
          decoration: cubit.imgFile == null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.highlightColor,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.highlightColor,
                  image: DecorationImage(
                    image: FileImage(cubit.imgFile),
                    fit: BoxFit.cover,
                  ),
                ),
          child: (cubit.imgFile == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        AppIcons.photoCapture,
                        color: AppColors.tdGrey,
                        size: 50,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      text.tr(),
                      style: font!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.tdGrey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );
  }
}
