import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import '../../utils/common_strings.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const _focusAreas = [
    (
      'assets/svg/mobile-phone.svg',
      'Mobile Development',
      'Production Flutter apps for iOS and Android — Firebase, location services, and clean architecture.',
    ),
    (
      'assets/svg/spring.svg',
      'Backend & APIs',
      'Java and Spring Boot services, REST APIs, SQL, and integration workflows for real products.',
    ),
    (
      'assets/svg/azure.svg',
      'Cloud & DevOps',
      'Azure services, CI/CD pipelines, and cloud architecture for reliable delivery.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: _layout(context, horizontal: 10, cardPadding: 16, iconSize: 55),
      desktopView: _layout(context, horizontal: 30, cardPadding: 24, iconSize: 65),
    );
  }

  Widget _layout(
    BuildContext context, {
    required double horizontal,
    required double cardPadding,
    required double iconSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(horizontal, 20, horizontal, 10),
          child: SelectableText(
            CommonStrings.aboutMe,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.65),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "What I'm doing",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              ResponsiveLayout(
                mobileView: Column(
                  children: _focusAreas
                      .map((area) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _focusCard(context, area, cardPadding, iconSize),
                          ))
                      .toList(),
                ),
                desktopView: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _focusAreas
                      .map((area) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: _focusCard(context, area, cardPadding, iconSize),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _focusCard(
    BuildContext context,
    (String, String, String) area,
    double padding,
    double iconSize,
  ) {
    return Neumorphic(
      padding: EdgeInsets.all(padding),
      style: cardStyle(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(area.$1, height: iconSize),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  area.$2,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                SelectableText(
                  area.$3,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.lightGray,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
