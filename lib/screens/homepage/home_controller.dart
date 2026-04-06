import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:portfolio/screens/homepage/about_view.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/screens/homepage/resume_view.dart';
import 'package:portfolio/screens/homepage/certificates_view.dart';
import 'package:portfolio/utils/environment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

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

  static const String _web3formsKey = 'ef98c022-ece2-42dc-8514-da90b8aaa47b';

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

    final String fromName = nameController.value.text.trim();
    final String fromEmail = emailController.value.text.trim();
    final String fromMessage = messageController.value.text.trim();

    bool notificationSent = false;

    // --- Step 1: Send notification to Mithulram via Web3Forms ---
    try {
      final response = await http.post(
        Uri.parse('https://api.web3forms.com/submit'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'access_key': _web3formsKey,
          'subject': 'New Portfolio Message from $fromName',
          'name': fromName,
          'email': fromEmail,
          'message': fromMessage,
          'from_name': 'Portfolio Contact Form',
        }),
      );
      if (response.statusCode == 200) {
        notificationSent = true;
        print("Web3Forms notification sent successfully");
      } else {
        print("Web3Forms error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Web3Forms request failed: $e");
    }

    // --- Step 2: Send auto-reply to visitor ---
    try {
      final autoReplyResponse = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'service_id': Environment.serviceId,
          'template_id': Environment.autoReplyTemplateId,
          'user_id': Environment.publicKey,
          'accessToken': Environment.privateKey,
          'template_params': {
            'to_name': fromName,
            'to_email': fromEmail,
            'message': fromMessage,
          },
        }),
      );
      if (autoReplyResponse.statusCode == 200) {
        print("Auto-reply sent successfully");
      } else {
        print("Auto-reply HTTP error: ${autoReplyResponse.statusCode} - ${autoReplyResponse.body}");
        // Fallback: JS SDK
        await _sendAutoReplyViaEmailJS(
          fromName: fromName,
          fromEmail: fromEmail,
          message: fromMessage,
        );
      }
    } catch (e) {
      print("Auto-reply failed: $e");
    }

    // Always clear the form
    nameController.value.clear();
    emailController.value.clear();
    messageController.value.clear();
    formKey.currentState?.reset();
    loading.value = false;

    if (notificationSent) {
      CommonMethods().showSuccessToast("Message Sent Successfully!");
      return true;
    } else {
      CommonMethods().showDangerToast("Failed to send message. Please try again.");
      return false;
    }
  }

  Future<void> _sendAutoReplyViaEmailJS({
    required String fromName,
    required String fromEmail,
    required String message,
  }) {
    final completer = Completer<void>();
    try {
      js.context.callMethod('sendEmailJS', [
        Environment.serviceId,
        Environment.autoReplyTemplateId,
        js.JsObject.jsify({
          'to_name': fromName,
          'to_email': fromEmail,
          'message': message,
        }),
        js.allowInterop((String status) => completer.complete()),
        js.allowInterop((String error) => completer.completeError(error)),
      ]);
    } catch (e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }
}
