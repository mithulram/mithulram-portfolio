import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatesView extends StatelessWidget {
  const CertificatesView({super.key});

  static const _hackerrankProfile = 'https://www.hackerrank.com/profile/mithulramg';

  @override
  Widget build(BuildContext context) {
    final cards = certificateCards(context);

    return ResponsiveLayout(
      mobileView: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context, cards.length),
            const SizedBox(height: 16),
            ...cards,
          ],
        ),
      ),
      desktopView: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context, cards.length),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: cards,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, int count) {
    return Row(
      children: [
        Neumorphic(
          padding: const EdgeInsets.all(12),
          style: cardStyle(radius: 12),
          child: const Icon(Icons.verified_outlined,
              color: AppColors.accent, size: 18),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                'Professional Certifications',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$count credentials across cloud, languages, and engineering',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> certificateCards(BuildContext context) {
    return [
      const CertificateCard(
        title: 'Microsoft Azure Solutions Architect Expert',
        issuer: 'Microsoft',
        date: '2024',
        description:
            'Designing and implementing solutions on Microsoft Azure at expert level',
        imagePath: 'assets/images/certificates/Solution_arc-1.png',
        certificateUrl:
            'https://learn.microsoft.com/en-us/users/mithulramg-5060/credentials/certification/azure-solutions-architect',
        icon: Icons.architecture,
        color: Colors.purple,
      ),
      const CertificateCard(
        title: 'Microsoft Azure Administrator (AZ-104)',
        issuer: 'Microsoft',
        date: '2024',
        description:
            'Administration and management of Azure cloud services and resources',
        imagePath:
            'assets/images/certificates/mithulramg Microsoft az-104-1.png',
        certificateUrl:
            'https://learn.microsoft.com/en-us/users/mithulramg-5060/credentials/certification/azure-administrator',
        icon: Icons.cloud,
        color: Colors.blue,
      ),
      const CertificateCard(
        title: 'Java SE 11 Developer',
        issuer: 'Oracle',
        date: '2022',
        description:
            'Professional Java development certification for the SE 11 platform',
        imagePath:
            'assets/images/certificates/Certificate Java SE 11 dev-1.png',
        certificateUrl:
            'https://education.oracle.com/java/java-se/product_267',
        icon: Icons.code,
        color: Colors.orange,
      ),
      const CertificateCard(
        title: 'PCAP – Python Certified Associate',
        issuer: 'Python Institute',
        date: '2023',
        description:
            'Foundational Python programming and software development certification',
        imagePath: '',
        certificateUrl: 'https://pythoninstitute.org/pcap',
        icon: Icons.terminal,
        color: Colors.green,
      ),
      const CertificateCard(
        title: 'Advanced Programming in C++',
        issuer: 'C++ Institute',
        date: '2021',
        description: 'Advanced C++ programming and software development',
        imagePath:
            'assets/images/certificates/certificate_vb3f.j6jH.Ew3M (1)-1.png',
        certificateUrl: 'https://cppinstitute.org/certifications',
        icon: Icons.developer_mode,
        color: Colors.indigo,
      ),
      CertificateCard(
        title: 'Java Programming',
        issuer: 'HackerRank',
        date: '2023',
        description: 'Java programming skills certification',
        imagePath: 'assets/images/certificates/java hackerrank.png',
        certificateUrl: _hackerrankProfile,
        icon: Icons.code,
        color: Colors.red,
      ),
      CertificateCard(
        title: 'JavaScript Programming',
        issuer: 'HackerRank',
        date: '2023',
        description: 'JavaScript programming skills certification',
        imagePath: 'assets/images/certificates/javascript hackerrank.png',
        certificateUrl: _hackerrankProfile,
        icon: Icons.javascript,
        color: Colors.yellow,
      ),
      CertificateCard(
        title: 'Python Programming',
        issuer: 'HackerRank',
        date: '2023',
        description: 'Python programming skills certification',
        imagePath: 'assets/images/certificates/python hackerrank.png',
        certificateUrl: _hackerrankProfile,
        icon: Icons.code,
        color: Colors.teal,
      ),
      CertificateCard(
        title: 'SQL Programming',
        issuer: 'HackerRank',
        date: '2023',
        description: 'SQL and database skills certification',
        imagePath: 'assets/images/certificates/SQL hackerrank.png',
        certificateUrl: _hackerrankProfile,
        icon: Icons.storage,
        color: Colors.cyan,
      ),
      const CertificateCard(
        title: 'Google Analytics',
        issuer: 'LinkedIn Learning',
        date: '2023',
        description:
            'Web analytics fundamentals for measuring and improving digital products',
        imagePath: '',
        certificateUrl:
            'https://www.linkedin.com/in/mithulram-g-926ba520a/details/certifications/',
        icon: Icons.analytics_outlined,
        color: Colors.deepOrange,
      ),
    ];
  }
}

class CertificateCard extends StatelessWidget {
  final String title;
  final String issuer;
  final String date;
  final String description;
  final String imagePath;
  final String certificateUrl;
  final IconData icon;
  final Color color;

  const CertificateCard({
    super.key,
    required this.title,
    required this.issuer,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.certificateUrl,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: _card(context, fullWidth: true),
      desktopView: SizedBox(width: 350, child: _card(context)),
    );
  }

  Widget _card(BuildContext context, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? double.infinity : null,
      margin: EdgeInsets.only(bottom: fullWidth ? 15 : 0),
      child: GestureDetector(
        onTap: () => _showCertificateModal(context),
        child: Neumorphic(
          padding: const EdgeInsets.all(18),
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
            depth: 0.4,
            lightSource: LightSource.topLeft,
            color: AppColors.lightBlackContainer,
            shadowLightColor: AppColors.selectionColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: color, size: 26),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          issuer,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.selectionColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.selectionColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.selectionColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightGray,
                      height: 1.4,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 16,
                    color: AppColors.selectionColor.withOpacity(0.7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Tap to view details',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.selectionColor.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCertificateModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                depth: 0.8,
                lightSource: LightSource.topLeft,
                color: AppColors.lightBlackContainer,
                shadowLightColor: AppColors.selectionColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(icon, color: color, size: 30),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                maxLines: 2,
                              ),
                              Text(
                                '$issuer · $date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColors.selectionColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          if (imagePath.isNotEmpty)
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      AppColors.selectionColor.withOpacity(0.3),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return _placeholderIcon();
                                  },
                                ),
                              ),
                            )
                          else
                            _placeholderIcon(height: 180),
                          const SizedBox(height: 20),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          NeumorphicButton(
                            onPressed: () => _launchUrl(certificateUrl),
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                              depth: 0.4,
                              lightSource: LightSource.topLeft,
                              color: AppColors.lightBlackContainer,
                              shadowLightColor: AppColors.selectionColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.verified,
                                  color: AppColors.selectionColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'View Credential',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.selectionColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _placeholderIcon({double height = 120}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Icon(icon, size: 56, color: color.withOpacity(0.6)),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
