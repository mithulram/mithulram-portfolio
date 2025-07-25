import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:portfolio/utils/controllers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/common_strings.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    //analyticServices.logScreenView(screenName: context.toString());

    return ResponsiveLayout(
        mobileView: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 24,
            ),
            itemCount: children(context).length,
            itemBuilder: (context, index) => children(context)[index],
          ),
        ),
        desktopView: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.4,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
            ),
            itemCount: children(context).length,
            itemBuilder: (context, index) => children(context)[index],
          ),
        ));
  }

  List<Widget> children(BuildContext context) {
    return [
      PortfolioCard(context, portfolioInfo: CommonStrings.sudokuSolverApp),
      PortfolioCard(context,
          portfolioInfo: CommonStrings.pathfindingVisualizationApp),
      PortfolioCard(context, portfolioInfo: CommonStrings.snakeGameApp),
      PortfolioCard(context, portfolioInfo: CommonStrings.portfolioApp),
      // PortfolioCard(context, portfolioInfo: CommonStrings.workAnywhereApp),
      PortfolioCard(context, portfolioInfo: CommonStrings.neoMartApp),
      PortfolioCard(context, portfolioInfo: CommonStrings.remoteCursorPackage),
    ];
  }

  Widget PortfolioCard(BuildContext context,
      {required Map<String, String> portfolioInfo}) {
    return ResponsiveLayout(
      mobileView: SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Get.dialog(
              CustomDialogue(portfolioInfo: portfolioInfo),
              barrierDismissible: true,
              transitionDuration: const Duration(milliseconds: 500),
              transitionCurve: Curves.easeInOut,
              useSafeArea: true,
            );
          },
          child: Neumorphic(
            padding: const EdgeInsets.all(16),
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
              depth: 0.4,
              lightSource: LightSource.topLeft,
              color: AppColors.lightBlackContainer,
              shadowLightColor: AppColors.selectionColor,
            ),
            child: Row(
              children: [
                // Image
                Container(
                  width: 120,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: portfolioInfo['coverImage']!.startsWith('http')
                      ? Image.network(
                          portfolioInfo['coverImage']!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          portfolioInfo['coverImage']!,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        portfolioInfo['title']!,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        portfolioInfo['type']!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.selectionColor,
                            ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      desktopView: Container(
        child: InkWell(
          onTap: () {
            Get.dialog(
              CustomDialogue(portfolioInfo: portfolioInfo),
              barrierDismissible: true,
              transitionDuration: const Duration(milliseconds: 500),
              transitionCurve: Curves.easeInOut,
              useSafeArea: true,
            );
          },
          child: Neumorphic(
            padding: const EdgeInsets.all(20),
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
              depth: 0.4,
              lightSource: LightSource.topLeft,
              color: AppColors.lightBlackContainer,
              shadowLightColor: AppColors.selectionColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 140,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: portfolioInfo['coverImage']!.startsWith('http')
                      ? Image.network(
                          portfolioInfo['coverImage']!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          portfolioInfo['coverImage']!,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        portfolioInfo['title']!,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        portfolioInfo['type']!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.selectionColor,
                            ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDialogue extends StatelessWidget {
  final Map<String, String> portfolioInfo;
  const CustomDialogue({required this.portfolioInfo, super.key});

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
                child: Column(
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
                            child: portfolioInfo['iconUrl']! == ""
                                ? Image.asset(
                                    'assets/images/app-icon.jpg',
                                    fit: BoxFit.cover,
                                  )
                                : portfolioInfo['iconUrl']!.startsWith('http')
                                    ? Image.network(
                                        portfolioInfo['iconUrl']!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        portfolioInfo['iconUrl']!,
                                        fit: BoxFit.cover,
                                      )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableText(
                                  portfolioInfo['title']!,
                                  maxLines: 2,
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                portfolioInfo['playstoreUrl']! == ""
                                    ? const SizedBox()
                                    : portfolioInfo['playstoreUrl']!
                                            .contains('pub.dev')
                                        ? InkWell(
                                            onTap: () async {
                                              if (!await launchUrl(Uri.parse(
                                                  portfolioInfo[
                                                      'playstoreUrl']!))) {
                                                throw Exception(
                                                    "could not launch url");
                                              }
                                            },
                                            child: CustomContainer(
                                              bgColor:
                                                  AppColors.lightBlackContainer,
                                              borderColor: Colors.transparent,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              border: 8,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/svg/dart.svg',
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "  pub.dev",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () async {
                                              if (!await launchUrl(Uri.parse(
                                                  portfolioInfo[
                                                      'playstoreUrl']!))) {
                                                throw Exception(
                                                    "could not launch url");
                                              }
                                            },
                                            child: CustomContainer(
                                              bgColor:
                                                  AppColors.lightBlackContainer,
                                              borderColor: Colors.transparent,
                                              padding: const EdgeInsets.all(8),
                                              border: 8,
                                              child: SvgPicture.asset(
                                                'assets/svg/playstore.svg',
                                                height: 14,
                                              ),
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
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.lightGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: SelectableText(
                                    portfolioInfo['about']!,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
              maxWidth: Get.width * .45, maxHeight: Get.height * .7),
          child: AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: CustomContainer(
                padding: const EdgeInsets.all(20),
                child: Row(
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
                            child: portfolioInfo['iconUrl']! == ""
                                ? Image.asset(
                                    'assets/images/app-icon.jpg',
                                    fit: BoxFit.cover,
                                  )
                                : portfolioInfo['iconUrl']!.startsWith('http')
                                    ? Image.network(
                                        portfolioInfo['iconUrl']!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        portfolioInfo['iconUrl']!,
                                        fit: BoxFit.cover,
                                      )),
                        const SizedBox(
                          height: 40,
                        ),
                        portfolioInfo['playstoreUrl']! == ""
                            ? const SizedBox()
                            : portfolioInfo['playstoreUrl']!.contains('pub.dev')
                                ? InkWell(
                                    onTap: () async {
                                      if (!await launchUrl(Uri.parse(
                                          portfolioInfo['playstoreUrl']!))) {
                                        throw Exception("could not launch url");
                                      }
                                    },
                                    child: CustomContainer(
                                      bgColor: AppColors.lightBlackContainer,
                                      borderColor: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      border: 8,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/dart.svg',
                                            height: 20,
                                          ),
                                          Text(
                                            "  pub.dev",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      if (!await launchUrl(Uri.parse(
                                          portfolioInfo['playstoreUrl']!))) {
                                        throw Exception("could not launch url");
                                      }
                                    },
                                    child: CustomContainer(
                                      bgColor: AppColors.lightBlackContainer,
                                      borderColor: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      border: 8,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/playstore.svg',
                                            height: 20,
                                          ),
                                          Text(
                                            "  Play Store",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
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
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: SelectableText(
                                    portfolioInfo['title']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                  child: SelectableText(
                                    portfolioInfo['about']!,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.lightGray,
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
    );
  }
}
