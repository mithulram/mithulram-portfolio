import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import '../../utils/common_strings.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const _focusAreas = [
    _FocusArea(
      icon: Icons.api_outlined,
      title: 'Backend and APIs',
      description:
          'Java, Spring Boot, REST APIs, validation, authorization, audit events, and integration tests.',
    ),
    _FocusArea(
      icon: Icons.storage_outlined,
      title: 'Data quality',
      description:
          'Python, DuckDB, SQL, quarantine-first validation, lineage, and reliable analytical outputs.',
    ),
    _FocusArea(
      icon: Icons.shield_outlined,
      title: 'Systems and security',
      description:
          'Threat modeling, risk scoring, access control, automotive-security research, and failure-mode analysis.',
    ),
    _FocusArea(
      icon: Icons.devices_outlined,
      title: 'Product delivery',
      description:
          'Flutter, React, mobile-to-backend workflows, analytics, diagnostics, and accessible interfaces.',
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
            child: Icon(
              area.icon,
              color: AppColors.selectionColor,
              size: 34,
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
  final IconData icon;
  final String title;
  final String description;

  const _FocusArea({
    required this.icon,
    required this.title,
    required this.description,
  });
}
