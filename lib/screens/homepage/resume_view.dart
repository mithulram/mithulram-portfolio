import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:portfolio/utils/controllers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/common_strings.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    // print("context: ${context.toString()}");
    //analyticServices.logScreenView(screenName: context.toString());

    return ResponsiveLayout(
      mobileView: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TimeLineListView(
            //   title: "Education",
            //   icon: const Icon(
            //     Icons.school_outlined,
            //     color: AppColors.accent,
            //     size: 18,
            //     weight: .2,
            //   ),
            //   data: CommonStrings.educationMap.reversed.toList(),
            // ),
            Row(
              children: [
                Neumorphic(
                  padding: const EdgeInsets.all(12),
                  style: cardStyle(radius: 12),
                  child: const Icon(
                    Icons.school_outlined,
                    color: AppColors.accent,
                    size: 18,
                    weight: .2,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SelectableText(
                  "Education",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TimeLineListView(
              title: "Education",
              data: CommonStrings.educationMap.reversed.toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Neumorphic(
                  padding: const EdgeInsets.all(12),
                  style: cardStyle(radius: 12),
                  child: const Icon(
                    Icons.school_outlined,
                    color: AppColors.accent,
                    size: 18,
                    weight: .2,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SelectableText(
                  "Experience",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TimeLineListView(
              title: "Experience",
              data: CommonStrings.experienceMap,
            ),
            const SizedBox(
              height: 40,
            ),
            SelectableText(
              "My Skills",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  SkillCard(
                    title: "Flutter",
                    child: SvgPicture.asset(
                      'assets/svg/flutter.svg',
                      height: 65,
                    ),
                  ),
                  SkillCard(
                    title: "React",
                    child: SvgPicture.asset(
                      'assets/svg/react.svg',
                      height: 65,
                    ),
                  ),
                  SkillCard(
                    title: "React Native",
                    child: SvgPicture.asset(
                      'assets/svg/react.svg',
                      height: 65,
                    ),
                  ),
                  SkillCard(
                    title: "Dart",
                    child: SvgPicture.asset(
                      'assets/svg/dart.svg',
                      height: 65,
                    ),
                  ),
                  SkillCard(
                    title: "Javascript",
                    child: Image.asset(
                      'assets/images/javascript.png',
                      height: 65,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      desktopView: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TimeLineListView(
            //   title: "Education",
            //   icon: const Icon(
            //     Icons.school_outlined,
            //     color: AppColors.accent,
            //     size: 18,
            //     weight: .2,
            //   ),
            //   data: CommonStrings.educationMap.reversed.toList(),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Neumorphic(
                      padding: const EdgeInsets.all(12),
                      style: cardStyle(radius: 12),
                      child: const Icon(
                        Icons.school_outlined,
                        color: AppColors.accent,
                        size: 18,
                        weight: .2,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SelectableText(
                      "Education",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                downloadCVButton(),
              ],
            ),
            TimeLineListView(
              title: "Education",
              data: CommonStrings.educationMap.reversed.toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Neumorphic(
                  padding: const EdgeInsets.all(12),
                  style: cardStyle(radius: 12),
                  child: const Icon(
                    Icons.school_outlined,
                    color: AppColors.accent,
                    size: 18,
                    weight: .2,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SelectableText(
                  "Experience",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TimeLineListView(
              title: "Experience",
              data: CommonStrings.experienceMap,
            ),
            const SizedBox(
              height: 40,
            ),
            SelectableText(
              "My Skills",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                SkillCard(
                  title: "Flutter",
                  child: SvgPicture.asset(
                    'assets/svg/flutter.svg',
                    height: 65,
                  ),
                ),
                SkillCard(
                  title: "React",
                  child: SvgPicture.asset(
                    'assets/svg/react.svg',
                    height: 65,
                  ),
                ),
                SkillCard(
                  title: "React Native",
                  child: SvgPicture.asset(
                    'assets/svg/react.svg',
                    height: 65,
                  ),
                ),
                SkillCard(
                  title: "Dart",
                  child: SvgPicture.asset(
                    'assets/svg/dart.svg',
                    height: 65,
                  ),
                ),
                SkillCard(
                  title: "Javascript",
                  child: Image.asset(
                    'assets/images/javascript.png',
                    height: 65,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  String title;
  Widget? child;
  SkillCard({required this.child, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      style: cardStyle(radius: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child ?? const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          SelectableText(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
