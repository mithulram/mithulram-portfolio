import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:portfolio/screens/homepage/about_view.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/screens/homepage/resume_view.dart';
import 'package:portfolio/screens/homepage/certificates_view.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portfolio/utils/environment.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/common_methods.dart';
import 'contact_view.dart';

class HomeController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxBool loading = false.obs;
  RxString selectedTabName = "About Me".obs;
  ScrollController scrollController = ScrollController();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  RxBool isExpanded = false.obs;
  final formKey = GlobalKey<FormState>();
  // MapController mapController = MapController(
  //   initPosition: GeoPoint(latitude: 28.6139, longitude: 77.2088),
  //   areaLimit: BoundingBox(
  //     east: 10.4922941,
  //     north: 47.8084648,
  //     south: 45.817995,
  //     west:  5.9559113,
  //   ),
  // );

  toggleExpanded() => isExpanded.value = !isExpanded.value;

  onSelectTab(int index) {
    selectedTabIndex.value = index;
  }

  getTabView() {
    switch (selectedTabIndex.value) {
      case 0:
        return const AboutView();
      case 1:
        return const ResumeView();
      case 2:
        return const PortfolioView();
      case 3:
        return const CertificatesView();
      case 4:
        return const ContactView();
      default:
        return const AboutView();
    }
  }

  Future<bool> sendEmail() async {
    loading.value = true;

    // Check if EmailJS is configured
    if (Environment.serviceId.isEmpty || Environment.publicKey.isEmpty) {
      // Fallback: Open email client
      return await _openEmailClient();
    }

    bool notificationSent = false;
    bool autoReplySent = false;

    try {
      // 1. Send notification to you
      await emailjs.send(
        Environment.serviceId,
        Environment.notificationTemplateId,
        {
          'from_name': nameController.value.text.trim(),
          'from_email': emailController.value.text.trim(),
          'message': messageController.value.text.trim(),
        },
        emailjs.Options(
          publicKey: Environment.publicKey,
          privateKey: Environment.privateKey,
        ),
      );
      notificationSent = true;
      print("Notification sent successfully");
    } catch (e) {
      print("Notification email failed: $e");
    }

    try {
      // Wait 3 seconds before sending auto-reply
      await Future.delayed(const Duration(seconds: 3));

      // 2. Send auto-reply to the sender
      await emailjs.send(
        Environment.serviceId,
        Environment.autoReplyTemplateId,
        {
          'to_name': nameController.value.text.trim(),
          'to_email': emailController.value.text.trim(),
          'message': messageController.value.text.trim(),
        },
        emailjs.Options(
          publicKey: Environment.publicKey,
          privateKey: Environment.privateKey,
        ),
      );
      autoReplySent = true;
      print("Auto-reply sent successfully");
    } catch (e) {
      print("Auto-reply email failed: $e");
    }

    loading.value = false;

    if (notificationSent || autoReplySent) {
      CommonMethods().showSuccessToast("Message Sent Successfully!");
      nameController.value.clear();
      emailController.value.clear();
      messageController.value.clear();
      formKey.currentState?.reset();
      return true;
    } else {
      CommonMethods()
          .showDangerToast("Failed to send message. Please try again.");
      return false;
    }
  }

  Future<bool> _openEmailClient() async {
    try {
      final name = nameController.value.text.trim();
      final email = emailController.value.text.trim();
      final message = messageController.value.text.trim();

      final subject = 'Contact from Portfolio - $name';
      final body = '''
Hello Mithulram,

You have received a new message from your portfolio:

Name: $name
Email: $email
Message: $message

Best regards,
Portfolio Contact Form
''';

      final uri = Uri.parse(
          'mailto:gmithulram@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        CommonMethods().showSuccessToast("Email client opened!");
        nameController.value.clear();
        emailController.value.clear();
        messageController.value.clear();
        formKey.currentState?.reset();
        loading.value = false;
        return true;
      } else {
        CommonMethods().showDangerToast("Could not open email client");
        loading.value = false;
        return false;
      }
    } catch (e) {
      CommonMethods().showDangerToast("Error opening email client");
      loading.value = false;
      return false;
    }
  }
}
