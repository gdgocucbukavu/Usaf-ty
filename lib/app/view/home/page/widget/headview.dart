import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../controller/cubit/homecubit.dart';
import '../../../../../controller/state/homestate.dart';
import '../../../../shared/shared.dart';

class HeadView extends StatelessWidget {
  final String contentName;
  final String contentMail;
  final dynamic contentImg;
  final bool isNetworkImg;
  const HeadView({
    super.key,
    required this.contentName,
    required this.contentMail,
    this.contentImg,
    required this.isNetworkImg,
  });

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic cubit = HomeCubit.get(context);
    dynamic theme = Theme.of(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  decoration: !isNetworkImg
                      ? BoxDecoration(
                          color: AppColors.tdGrey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.tdGrey,
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
                            color: AppColors.tdGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(contentImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                  height: sizeWidth * 0.1,
                  width: sizeWidth * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentName,
                      style: theme.textTheme.displaySmall.copyWith(
                        fontSize: sizeWidth * 0.03,
                      ),
                    ),
                    Text(
                      contentMail,
                      style: theme.textTheme.labelMedium.copyWith(
                        fontSize: sizeWidth * 0.02,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            !isNetworkImg
                ? Container()
                : GestureDetector(
                    onTap: () {
                      cubit.isLiked();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          cubit.isLike ? AppIcons.starB : AppIcons.star,
                          color: AppColors.tdYellowB,
                        ),
                        Text(
                          cubit.starCount == 0 ? '' : '${cubit.starCount} k',
                          style: theme.textTheme.labelMedium.copyWith(
                            fontSize: sizeWidth * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}
