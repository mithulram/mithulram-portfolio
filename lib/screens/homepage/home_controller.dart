
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:portfolio/screens/homepage/about_view.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/screens/homepage/resume_view.dart';
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
      case 0: return const AboutView();
      case 1: return const ResumeView();
      case 2: return const PortfolioView();
      case 3: return const ContactView();
      default: return const AboutView();
    }
  }

  Future<bool> sendEmail() async {
    try {
      loading.value = true;
      await emailjs.send(
        Environment.serviceId,
        Environment.templateId,
        {
          'to_name': nameController.value.text.trim().toString(),
          'user_email': emailController.value.text.trim().toString(),
          'reply_to': "rchauhan439@gmail.com",
          'message': messageController.value.text.trim().toString()
        },
        emailjs.Options(
          publicKey: Environment.publicKey,
          privateKey: Environment.privateKey,
          limitRate: const emailjs.LimitRate(
            id: 'web-app',
            throttle: 10000,
          ),
        ),
      );
      print('SUCCESS!');
      CommonMethods().showSuccessToast("Message Sent!");
      loading.value = false;
      return true;
    } catch (error) {
      CommonMethods().showDangerToast("Something went wrong!");
      loading.value = false;
      if (error is emailjs.EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
      return false;
    }
  }
}