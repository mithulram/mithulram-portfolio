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
            Wrap(
              runSpacing: 15,
              spacing: 15,
              children: _skillCards(context),
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
              runSpacing: 15,
              spacing: 15,
              children: _skillCards(context),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _skillCards(BuildContext context) {
    return [
      SkillChip(title: "Flutter", icon: SvgPicture.asset('assets/svg/flutter.svg', height: 22)),
      SkillChip(title: "Python", icon: SvgPicture.asset('assets/svg/python.svg', height: 22)),
      SkillChip(title: "Java", icon: SvgPicture.asset('assets/svg/java.svg', height: 22)),
      SkillChip(title: "Spring Boot", icon: SvgPicture.asset('assets/svg/spring.svg', height: 22)),
      SkillChip(title: "Azure", icon: SvgPicture.asset('assets/svg/azure.svg', height: 22)),
      SkillChip(title: "SQL", icon: SvgPicture.asset('assets/svg/sql.svg', height: 22)),
      SkillChip(title: "JavaScript", icon: SvgPicture.asset('assets/svg/javascript.svg', height: 22)),
    ];
  }
}

class SkillChip extends StatelessWidget {
  final String title;
  final Widget icon;
  const SkillChip({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightBlackContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
