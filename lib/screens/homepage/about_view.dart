import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import '../../utils/common_strings.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const _goldFilter = ColorFilter.mode(
    AppColors.selectionColor,
    BlendMode.srcIn,
  );

  static const _focusAreas = [
    _FocusArea(
      iconPath: 'assets/svg/spring.svg',
      title: 'Backend & Secure APIs',
      description:
          'Java, Spring Boot, RBAC, audit events, REST APIs, and integration tests for systems you can inspect.',
    ),
    _FocusArea(
      iconPath: 'assets/svg/python.svg',
      title: 'Data & Observability',
      description:
          'Python pipelines, DuckDB, quarantine handling, FastAPI monitors, SLOs, and Prometheus metrics.',
    ),
    _FocusArea(
      iconPath: 'assets/svg/flutter.svg',
      title: 'Mobile & Product',
      description:
          'Production Flutter apps with Firebase, clean architecture, BLoC, and real user-facing workflows.',
    ),
    _FocusArea(
      iconPath: 'assets/svg/azure.svg',
      title: 'Cloud & Engineering',
      description:
          'Azure, CI/CD, system design, testing discipline, and maintainable delivery practices.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: _layout(context, horizontal: 10, columns: 1),
      tabView: _layout(context, horizontal: 20, columns: 2),
      desktopView: _layout(context, horizontal: 30, columns: 2),
    );
  }

  Widget _layout(BuildContext context,
      {required double horizontal, required int columns}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(horizontal, 20, horizontal, 16),
          child: SelectableText(
            CommonStrings.aboutMe,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color: AppColors.lightGray.withValues(alpha: 0.95),
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(horizontal, 0, horizontal, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "What I'm doing",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 6),
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  gradient: AppColors.yellowGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = columns == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 16) / columns;
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: _focusAreas
                        .map(
                          (area) => SizedBox(
                            width: cardWidth,
                            child: _focusCard(context, area),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _focusCard(BuildContext context, _FocusArea area) {
    return Neumorphic(
      padding: const EdgeInsets.all(20),
      style: cardStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.selectionColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.selectionColor.withValues(alpha: 0.35),
              ),
            ),
            child: SvgPicture.asset(
              area.iconPath,
              height: 34,
              colorFilter: _goldFilter,
            ),
          ),
          const SizedBox(height: 16),
          SelectableText(
            area.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            area.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightGray,
                  height: 1.55,
                ),
          ),
        ],
      ),
    );
  }
}

class _FocusArea {
  final String iconPath;
  final String title;
  final String description;

  const _FocusArea({
    required this.iconPath,
    required this.title,
    required this.description,
  });
}
