import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:portfolio/screens/homepage/about_view.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/screens/homepage/resume_view.dart';
import 'package:portfolio/screens/homepage/certificates_view.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portfolio/utils/environment.dart';

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
    bool notificationSent = false;
    bool autoReplySent = false;

    try {
      // 1. Send notification to you
      await emailjs.send(
        Environment.serviceId,
        Environment.notificationTemplateId,
        {
          'to_name': 'Mithul',
          'to_email': 'gmithulram@gmail.com',
          'from_name': nameController.value.text.trim(),
          'from_email': emailController.value.text.trim(),
          'reply_to': emailController.value.text.trim(),
          'message': messageController.value.text.trim(),
          'subject': 'New Contact Message from Portfolio'
        },
        emailjs.Options(
          publicKey: Environment.publicKey,
          privateKey: Environment.privateKey,
          limitRate: const emailjs.LimitRate(id: 'web-app', throttle: 10000),
        ),
      );
      notificationSent = true;
    } catch (e) {
      print("Notification email failed: $e");
    }

    try {
      // Wait 30 seconds before sending auto-reply to avoid rate limiting
      await Future.delayed(const Duration(seconds: 30));
      await emailjs.send(
        Environment.serviceId,
        Environment.autoReplyTemplateId,
        {
          'to_name': nameController.value.text.trim(),
          'to_email': emailController.value.text.trim(),
          'from_name': 'Mithulram Gunasekaran',
          'from_email': 'gmithulram@gmail.com',
          'message': messageController.value.text.trim(),
          'subject': "We've received your message!"
        },
        emailjs.Options(
          publicKey: Environment.publicKey,
          privateKey: Environment.privateKey,
          limitRate: const emailjs.LimitRate(id: 'web-app', throttle: 10000),
        ),
      );
      autoReplySent = true;
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
}
