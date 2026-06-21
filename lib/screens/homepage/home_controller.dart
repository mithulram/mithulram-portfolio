import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:portfolio/screens/homepage/about_view.dart';
import 'package:portfolio/screens/homepage/certificates_view.dart';
import 'package:portfolio/screens/homepage/contact_view.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/screens/homepage/resume_view.dart';
import 'package:portfolio/services/contact_service.dart';

import '../../utils/common_methods.dart';

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
  final ContactService _contactService = ContactService();

  toggleExpanded() => isExpanded.value = !isExpanded.value;

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

    final result = await _contactService.send(
      name: nameController.value.text.trim(),
      email: emailController.value.text.trim(),
      message: messageController.value.text.trim(),
    );

    nameController.value.clear();
    emailController.value.clear();
    messageController.value.clear();
    formKey.currentState?.reset();
    loading.value = false;

    if (result.success) {
      CommonMethods().showSuccessToast('Message sent successfully!');
      return true;
    }

    CommonMethods().showDangerToast(
      result.message ??
          'Failed to send message. Please email gmithulram@gmail.com directly.',
    );
    return false;
  }
}
