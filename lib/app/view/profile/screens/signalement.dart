import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:usaficity/app/shared/shared.dart';

class SignalPage extends StatelessWidget {
  static const route = '/signaler';
  const SignalPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signalisation",
                style: Theme.of(context).textTheme.titleMedium),
            Gap(sizeWidth * 0.03),
            Icon(
              AppIcons.signal,
              size: sizeWidth * 0.07,
            ),
            Gap(sizeWidth * 0.09)
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            PhotoPicker(),
            LocalisationPicker(),
            FiliedTextSignaler(),
            SendButton(),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic font2 = Theme.of(context).textTheme.titleMedium;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.01),
      width: sizeWidth * 0.90,
      height: sizeHeight * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.tdYellowB,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.send,
              color: AppColors.tdWhite,
              size: sizeWidth * 0.08,
            ),
            Gap(sizeWidth * 0.04),
            Text(
              "Envoyez",
              style: font2.copyWith(
                  fontSize: sizeWidth * 0.038,
                  fontWeight: FontWeight.normal,
                  color: AppColors.tdWhite),
            )
          ],
        ),
      ),
    );
  }
}

class FiliedTextSignaler extends StatelessWidget {
  const FiliedTextSignaler({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic font1 = Theme.of(context).textTheme.headlineSmall;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.01),
      width: sizeWidth * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.highlightColor,
      ),
      child: TextFormField(
        onChanged: null,
        maxLines: null,
        style: font1.copyWith(
            fontSize: sizeWidth * 0.035,
            fontWeight: FontWeight.normal,
            height: sizeHeight * 0.002),
        decoration: InputDecoration(
          hintText: "Signalez quelque chose !",
          hintStyle: font1.copyWith(
            fontSize: sizeWidth * 0.035,
            fontWeight: FontWeight.normal,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class LocalisationPicker extends StatelessWidget {
  const LocalisationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font1 = Theme.of(context).textTheme.headlineSmall;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
      width: sizeWidth * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                AppIcons.mapPin,
                color: AppColors.tdYellowB,
              ),
              Gap(sizeWidth * 0.04),
              Text(
                "Location, 101.0.1.3",
                style: font1.copyWith(
                  fontSize: sizeWidth * 0.035,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                AppIcons.actualiser,
                color: AppColors.tdYellowB,
                size: sizeWidth * 0.08,
              ))
        ],
      ),
    );
  }
}

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font2 = Theme.of(context).textTheme.bodyMedium;

    return Container(
      margin: EdgeInsets.all(sizeWidth * 0.05),
      width: sizeWidth * 0.90,
      height: sizeWidth * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.highlightColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              AppIcons.photoCapture,
              color: AppColors.tdWhiteO,
              size: sizeWidth * 0.2,
            ),
          ),
          Gap(sizeWidth * 0.04),
          Text(
            "Choisir une photo",
            style: font2.copyWith(
                fontSize: sizeWidth * 0.038,
                fontWeight: FontWeight.normal,
                color: AppColors.tdWhiteO),
          ),
        ],
      ),
    );
  }
}
