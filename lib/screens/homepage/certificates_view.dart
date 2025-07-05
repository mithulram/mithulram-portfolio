import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:portfolio/utils/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/services.dart';

class CertificatesView extends StatelessWidget {
  const CertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4.0,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
          ),
          itemCount: certificateCards(context).length,
          itemBuilder: (context, index) => certificateCards(context)[index],
        ),
      ),
      desktopView: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
          ),
          itemCount: certificateCards(context).length,
          itemBuilder: (context, index) => certificateCards(context)[index],
        ),
      ),
    );
  }

  List<Widget> certificateCards(BuildContext context) {
    return [
      const CertificateCard(
        title: "Microsoft Azure Administrator (AZ-104)",
        issuer: "Microsoft",
        date: "2024",
        description:
            "Administration and management of Azure cloud services and resources",
        imagePath:
            "assets/images/certificates/mithulramg Microsoft az-104-1.png",
        certificateUrl:
            "https://www.credly.com/badges/your-azure-badge-id", // Replace with actual URL
        icon: Icons.cloud,
        color: Colors.blue,
      ),
      const CertificateCard(
        title: "Java SE 11 Developer",
        issuer: "Oracle",
        date: "2022",
        description:
            "Professional Java development certification for SE 11 platform",
        imagePath:
            "assets/images/certificates/Certificate Java SE 11 dev-1.png",
        certificateUrl:
            "https://education.oracle.com/java/java-se/product_267", // Replace with actual URL
        icon: Icons.code,
        color: Colors.orange,
      ),
      const CertificateCard(
        title: "Solution Architect",
        issuer: "Microsoft",
        date: "2024",
        description:
            "Advanced certification for designing and implementing solutions on Microsoft Azure",
        imagePath: "assets/images/certificates/Solution_arc-1.png",
        certificateUrl:
            "https://www.credly.com/badges/your-solution-architect-badge-id", // Replace with actual URL
        icon: Icons.architecture,
        color: Colors.purple,
      ),
      const CertificateCard(
        title: "Java Programming",
        issuer: "HackerRank",
        date: "2023",
        description: "Java programming skills certification from HackerRank",
        imagePath: "assets/images/certificates/java hackerrank.png",
        certificateUrl:
            "https://www.hackerrank.com/certificates/your-java-cert-id", // Replace with actual URL
        icon: Icons.code,
        color: Colors.red,
      ),
      const CertificateCard(
        title: "JavaScript Programming",
        issuer: "HackerRank",
        date: "2023",
        description:
            "JavaScript programming skills certification from HackerRank",
        imagePath: "assets/images/certificates/javascript hackerrank.png",
        certificateUrl:
            "https://www.hackerrank.com/certificates/your-javascript-cert-id", // Replace with actual URL
        icon: Icons.code,
        color: Colors.yellow,
      ),
      const CertificateCard(
        title: "Python Programming",
        issuer: "HackerRank",
        date: "2023",
        description: "Python programming skills certification from HackerRank",
        imagePath: "assets/images/certificates/python hackerrank.png",
        certificateUrl:
            "https://www.hackerrank.com/certificates/your-python-cert-id", // Replace with actual URL
        icon: Icons.code,
        color: Colors.green,
      ),
      const CertificateCard(
        title: "SQL Programming",
        issuer: "HackerRank",
        date: "2023",
        description: "SQL programming skills certification from HackerRank",
        imagePath: "assets/images/certificates/SQL hackerrank.png",
        certificateUrl:
            "https://www.hackerrank.com/certificates/your-sql-cert-id", // Replace with actual URL
        icon: Icons.storage,
        color: Colors.cyan,
      ),
      const CertificateCard(
        title: "Advanced Programming",
        issuer: "C++ Institute",
        date: "2021",
        description: "Advanced C++ programming and software development",
        imagePath:
            "assets/images/certificates/certificate_vb3f.j6jH.Ew3M (1)-1.png",
        certificateUrl:
            "https://cppinstitute.org/certifications/your-cpp-cert-id", // Replace with actual URL
        icon: Icons.developer_mode,
        color: Colors.indigo,
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
      mobileView: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => _showCertificateModal(context),
          child: Neumorphic(
            padding: const EdgeInsets.all(16),
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
              depth: 0.4,
              lightSource: LightSource.topLeft,
              color: AppColors.lightBlackContainer,
              shadowLightColor: AppColors.selectionColor,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        issuer,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.selectionColor,
                            ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.selectionColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.selectionColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      desktopView: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => _showCertificateModal(context),
          child: Neumorphic(
            padding: const EdgeInsets.all(20),
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
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: color, size: 28),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 4),
                          SelectableText(
                            issuer,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.selectionColor,
                                ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.selectionColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        date,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.selectionColor,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SelectableText(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
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
                    const SizedBox(width: 4),
                    Text(
                      "Tap to view certificate",
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
      ),
    );
  }

  void _showCertificateModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ResponsiveLayout(
            mobileView: Container(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
              margin: const EdgeInsets.all(16),
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
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
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
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(icon, color: color, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  maxLines: 2,
                                ),
                                Text(
                                  issuer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.selectionColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close,
                                color: Colors.grey, size: 20),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),

                    // Content
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Certificate Image
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      AppColors.selectionColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.withOpacity(0.1),
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Description
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            // Action Buttons - Mobile: Stacked
                            Column(
                              children: [
                                // View Certificate Button
                                SizedBox(
                                  width: double.infinity,
                                  child: NeumorphicButton(
                                    onPressed: () => _launchUrl(certificateUrl),
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      depth: 0.4,
                                      lightSource: LightSource.topLeft,
                                      color: AppColors.lightBlackContainer,
                                      shadowLightColor:
                                          AppColors.selectionColor,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.verified,
                                          color: AppColors.selectionColor,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "View Certificate",
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
                                ),

                                const SizedBox(height: 12),

                                // Download Button
                                SizedBox(
                                  width: double.infinity,
                                  child: NeumorphicButton(
                                    onPressed: () =>
                                        _downloadCertificate(context),
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      depth: 0.4,
                                      lightSource: LightSource.topLeft,
                                      color: AppColors.lightBlackContainer,
                                      shadowLightColor:
                                          AppColors.selectionColor,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.download,
                                          color: AppColors.selectionColor,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "Download PNG",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            desktopView: Container(
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
                    // Header
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
                                  issuer,
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

                    // Content
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Certificate Image
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      AppColors.selectionColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.withOpacity(0.1),
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Description
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 20),

                            // Action Buttons - Desktop: Side by side
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // View Certificate Button
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
                                      horizontal: 24, vertical: 14),
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
                                        "View Certificate",
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

                                // Download Button
                                NeumorphicButton(
                                  onPressed: () =>
                                      _downloadCertificate(context),
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
                                      horizontal: 24, vertical: 14),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.download,
                                        color: AppColors.selectionColor,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Download PNG",
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Handle error - could show a snackbar or dialog
      debugPrint('Could not launch $url');
    }
  }

  void _downloadCertificate(BuildContext context) async {
    try {
      // For web, we'll use a simpler approach
      final String fileName = imagePath.split('/').last;

      // Create a download link using the asset URL
      final String assetUrl = '/assets/$imagePath';

      // Create an anchor element and trigger download
      final html.AnchorElement anchor = html.AnchorElement(href: assetUrl);
      anchor.download = fileName;
      anchor.target = '_blank';

      // Add to DOM, click, and remove
      html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Downloading $title certificate...'),
          backgroundColor: AppColors.selectionColor,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to download certificate: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
