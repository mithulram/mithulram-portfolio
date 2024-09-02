
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/common_strings.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 20,
          runSpacing: 30,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          children: children(context),
        ),
      ),
      desktopView: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          children: children(context),
        ),
      )
    );
  }

  List<Widget> children (BuildContext context) {
    return [
      PortfolioCard(
          context,
          portfolioInfo: CommonStrings.portfolioApp
      ),
      PortfolioCard(
          context,
          portfolioInfo: CommonStrings.workAnywhereApp
      ),
      PortfolioCard(
          context,
          portfolioInfo: CommonStrings.talentAnywhereApp
      ),
      PortfolioCard(
          context,
          portfolioInfo: CommonStrings.darknetDiariesApp
      ),
      PortfolioCard(
          context,
          portfolioInfo: CommonStrings.libriVoxApp
      ),
    ];
  }

  Widget PortfolioCard(BuildContext context, {required Map<String, String> portfolioInfo}) {
    return ResponsiveLayout(
      mobileView: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.dialog(
                CustomDialogue(portfolioInfo: portfolioInfo),
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                transitionCurve: Curves.easeInOut,
                useSafeArea: true,
              );
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 350
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.asset(portfolioInfo['coverImage']!, fit: BoxFit.cover,)
              ),
            )
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelectableText(portfolioInfo['title']!, style: Theme.of(context).textTheme.titleMedium, maxLines: 1,),
                SelectableText(portfolioInfo['type']!, style: Theme.of(context).textTheme.bodyMedium, minLines: 1,),
              ],
            ),
          )
        ],
      ),
      desktopView: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.dialog(
                CustomDialogue(portfolioInfo: portfolioInfo),
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                transitionCurve: Curves.easeInOut,
                useSafeArea: true,
              );
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 250,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.asset(portfolioInfo['coverImage']!, fit: BoxFit.cover,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelectableText(portfolioInfo['title']!, style: Theme.of(context).textTheme.titleMedium, maxLines: 1,),
                SelectableText(portfolioInfo['type']!, style: Theme.of(context).textTheme.bodyMedium, minLines: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomDialogue extends StatelessWidget {
  Map<String, String> portfolioInfo;
  CustomDialogue({required this.portfolioInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: CustomContainer(
                padding: const EdgeInsets.all(16),
                child:
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AvatarContainer(
                            clip: Clip.antiAlias,
                            padding: EdgeInsets.zero,
                            radius: 20,
                            height: 80,
                            width: 80,
                            child: portfolioInfo['iconUrl']! == ""?
                            Image.asset('assets/images/app-icon.jpg', fit: BoxFit.cover,):
                            Image.asset(portfolioInfo['iconUrl']!, fit: BoxFit.cover,)
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableText(portfolioInfo['title']!,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                portfolioInfo['playstoreUrl']! == ""? const SizedBox():
                                InkWell(
                                  onTap: () async {
                                    if(!await launchUrl(Uri.parse(portfolioInfo['playstoreUrl']!))) {
                                      throw Exception("could not launch url");
                                    }
                                  },
                                  child: CustomContainer(
                                    bgColor: AppColors.lightBlackContainer,
                                    borderColor: Colors.transparent,
                                    padding: const EdgeInsets.all(8),
                                    border: 8,
                                    child: SvgPicture.asset('assets/svg/playstore.svg', height: 14,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: Get.back,
                          child: const AvatarContainer(
                            padding: EdgeInsets.all(2),
                            radius: 8,
                            child: Icon(Icons.close, size: 20, color: AppColors.lightGray,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Flexible(
                                  child: SelectableText(portfolioInfo['about']!,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      desktopView: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: Get.width * .45,
              maxHeight: Get.height * .7
          ),
          child: AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: CustomContainer(
                padding: const EdgeInsets.all(20),
                child:
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarContainer(
                            clip: Clip.antiAlias,
                            padding: EdgeInsets.zero,
                            height: 160,
                            width: 160,
                            child: portfolioInfo['iconUrl']! == ""?
                            Image.asset('assets/images/app-icon.jpg', fit: BoxFit.cover,):
                            Image.asset(portfolioInfo['iconUrl']!, fit: BoxFit.cover,)
                        ),
                        const SizedBox(height: 40,),
                        portfolioInfo['playstoreUrl']! == ""? const SizedBox():
                        InkWell(
                          onTap: () async {
                            if(!await launchUrl(Uri.parse(portfolioInfo['playstoreUrl']!))) {
                              throw Exception("could not launch url");
                            }
                          },
                          child: CustomContainer(
                            bgColor: AppColors.lightBlackContainer,
                            borderColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            border: 8,
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/playstore.svg', height: 20,),
                                Text("  Play Store", style: Theme.of(context).textTheme.bodySmall,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: SelectableText(portfolioInfo['title']!,
                                    style: Theme.of(context).textTheme.headlineLarge,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Flexible(
                                  child: SelectableText(portfolioInfo['about']!,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: Get.back,
                        child: const AvatarContainer(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(3),
                          radius: 8,
                          child: Icon(Icons.close, size: 20, color: AppColors.lightGray,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
