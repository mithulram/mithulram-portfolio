import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import '../../utils/common_strings.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: _content(context, isDesktop: false),
      tabView: _content(context, isDesktop: false, horizontal: 20),
      desktopView: _content(context, isDesktop: true),
    );
  }

  Widget _content(BuildContext context,
      {required bool isDesktop, double? horizontal}) {
    final hPad = horizontal ?? (isDesktop ? 30.0 : 10.0);
    final vertical = isDesktop ? 30.0 : 30.0;

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(
            context,
            icon: Icons.school_outlined,
            title: 'Education',
            trailing: isDesktop ? downloadCVButton() : null,
          ),
          TimeLineListView(
            title: 'Education',
            data: CommonStrings.educationMap,
          ),
          const SizedBox(height: 24),
          _sectionHeader(
            context,
            icon: Icons.work_outline_rounded,
            title: 'Experience',
          ),
          TimeLineListView(
            title: 'Experience',
            data: CommonStrings.experienceMap,
          ),
          const SizedBox(height: 32),
          _sectionHeader(
            context,
            icon: Icons.psychology_outlined,
            title: 'Technical Skills',
          ),
          const SizedBox(height: 16),
          ..._skillGroupSections(context),
          const SizedBox(height: 28),
          _sectionHeader(
            context,
            icon: Icons.translate_rounded,
            title: 'Languages',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: CommonStrings.languages
                .map((lang) => _languageChip(context, lang))
                .toList(),
          ),
          if (!isDesktop) ...[
            const SizedBox(height: 24),
            downloadCVButton(),
          ],
        ],
      ),
    );
  }

  Widget _sectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Neumorphic(
                padding: const EdgeInsets.all(12),
                style: cardStyle(radius: 12),
                child: Icon(icon, color: AppColors.accent, size: 18),
              ),
              const SizedBox(width: 16),
              SelectableText(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  List<Widget> _skillGroupSections(BuildContext context) {
    final skillIcons = <String, String>{
      'Java': 'assets/svg/java.svg',
      'J2EE': 'assets/svg/java.svg',
      'Spring Boot': 'assets/svg/spring.svg',
      'Spring Security': 'assets/svg/spring.svg',
      'Flutter': 'assets/svg/flutter.svg',
      'Dart': 'assets/svg/dart.svg',
      'Python': 'assets/svg/python.svg',
      'FastAPI': 'assets/svg/python.svg',
      'DuckDB': 'assets/svg/sql.svg',
      'C++': 'assets/svg/java.svg',
      'Azure': 'assets/svg/azure.svg',
      'SQL': 'assets/svg/sql.svg',
      'JavaScript': 'assets/svg/javascript.svg',
      'TypeScript': 'assets/svg/javascript.svg',
      'React': 'assets/svg/react.svg',
    };

    return CommonStrings.skillGroups.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.selectionColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: entry.value.map((skill) {
                final iconPath = skillIcons[skill];
                return SkillChip(
                  title: skill,
                  icon: iconPath != null
                      ? SvgPicture.asset(iconPath, height: 20)
                      : Icon(Icons.code, size: 18, color: AppColors.accent),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _languageChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBlackContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String title;
  final Widget icon;
  const SkillChip({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
