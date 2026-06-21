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
    //analyticServices.logScreenView(screenName: context.toString());

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
        tabView: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
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
        ));
  }

  List<Widget> children(BuildContext context) {
    return CommonStrings.featuredProjects
        .map((info) => PortfolioCard(context, portfolioInfo: info))
        .toList();
  }

  Widget PortfolioCard(BuildContext context,
      {required Map<String, String> portfolioInfo}) {
    final cover = ProjectCoverCard(
      label: portfolioInfo['coverLabel'] ?? portfolioInfo['title']!,
      tagline: portfolioInfo['coverTagline'] ?? portfolioInfo['type']!,
    );

    void openDialog() {
      Get.dialog(
        CustomDialogue(portfolioInfo: portfolioInfo),
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 500),
        transitionCurve: Curves.easeInOut,
        useSafeArea: true,
      );
    }

    return ResponsiveLayout(
      tabView: SizedBox(
        width: 230,
        child: _portfolioCardColumn(context, portfolioInfo, cover, openDialog),
      ),
      mobileView: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: openDialog,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: AspectRatio(aspectRatio: 16 / 9, child: cover),
            ),
          ),
          const SizedBox(height: 10),
          _portfolioCardLabels(context, portfolioInfo),
        ],
      ),
      desktopView: SizedBox(
        width: 230,
        child: _portfolioCardColumn(context, portfolioInfo, cover, openDialog),
      ),
    );
  }

  Widget _portfolioCardColumn(
    BuildContext context,
    Map<String, String> portfolioInfo,
    Widget cover,
    VoidCallback openDialog,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: openDialog,
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: AspectRatio(aspectRatio: 16 / 9, child: cover),
          ),
        ),
        const SizedBox(height: 10),
        _portfolioCardLabels(context, portfolioInfo, desktop: true),
      ],
    );
  }

  Widget _portfolioCardLabels(
    BuildContext context,
    Map<String, String> portfolioInfo, {
    bool desktop = false,
  }) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final typeStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          desktop
              ? Text(
                  portfolioInfo['title']!,
                  style: titleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : SelectableText(
                  portfolioInfo['title']!,
                  style: titleStyle,
                  maxLines: 1,
                ),
          desktop
              ? Text(
                  portfolioInfo['type']!,
                  style: typeStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : SelectableText(
                  portfolioInfo['type']!,
                  style: typeStyle,
                  minLines: 1,
                ),
        ],
      ),
    );
  }
}

class ProjectCoverCard extends StatelessWidget {
  final String label;
  final String tagline;

  const ProjectCoverCard({
    super.key,
    required this.label,
    required this.tagline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.smokeyBlack, AppColors.background],
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlackContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
            ),
          ),
          Positioned(
            left: 14,
            right: 56,
            top: 14,
            child: Text(
              'ENGINEERING',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.selectionColor,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Positioned(
            left: 14,
            right: 70,
            top: 34,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  tagline,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.lightGray,
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 14,
            bottom: 12,
            child: Container(
              width: 52,
              height: 3,
              decoration: BoxDecoration(
                gradient: AppColors.yellowGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 12,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.selectionColor.withValues(alpha: 0.35),
                ),
                color: AppColors.selectionColor.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              width: 42,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.smokeyBlack,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: AppColors.selectionColor.withValues(alpha: 0.35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.selectionColor.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 24,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialogue extends StatelessWidget {
  final Map<String, String> portfolioInfo;
  const CustomDialogue({required this.portfolioInfo, super.key});

  Widget _dialogCover(double width) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ProjectCoverCard(
            label: portfolioInfo['coverLabel'] ?? portfolioInfo['title']!,
            tagline: portfolioInfo['coverTagline'] ?? portfolioInfo['type']!,
          ),
        ),
      ),
    );
  }

  Widget _linkButton(BuildContext context,
      {required String url,
      required Widget icon,
      required String label}) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception("could not launch url");
        }
      },
      child: CustomContainer(
        bgColor: AppColors.lightBlackContainer,
        borderColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: 8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 6),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    final github = portfolioInfo['githubUrl'] ?? '';
    final playstore = portfolioInfo['playstoreUrl'] ?? '';
    final appstore = portfolioInfo['appstoreUrl'] ?? '';
    final buttons = <Widget>[];

    if (github.isNotEmpty) {
      buttons.add(_linkButton(context,
          url: github,
          icon: SvgPicture.asset('assets/svg/github.svg', height: 18),
          label: 'GitHub'));
    }
    if (appstore.isNotEmpty) {
      buttons.add(_linkButton(context,
          url: appstore,
          icon: const Icon(Icons.apple, size: 18, color: Colors.white),
          label: 'App Store'));
    }
    if (playstore.isNotEmpty) {
      final isAppStore = playstore.contains('apple.com');
      buttons.add(_linkButton(context,
          url: playstore,
          icon: isAppStore
              ? const Icon(Icons.apple, size: 18, color: Colors.white)
              : SvgPicture.asset('assets/svg/playstore.svg', height: 16),
          label: isAppStore ? 'App Store' : 'Play Store'));
    }

    if (buttons.isEmpty) return const SizedBox();
    return Wrap(spacing: 8, runSpacing: 8, children: buttons);
  }

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
                        _dialogCover(120),
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
                                const SizedBox(height: 8),
                                _buttons(context),
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
                        _dialogCover(200),
                        const SizedBox(height: 20),
                        _buttons(context),
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
