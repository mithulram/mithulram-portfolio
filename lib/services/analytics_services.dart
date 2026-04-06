

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:get/get.dart';
// import 'package:portfolio/utils/common_strings.dart';
//
// class AnalyticServices extends GetxController {
//   static AnalyticServices instance = Get.find(tag: 'analytics');
//   final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
//
//   Future logEvent({required String eventName}) async {
//     _analytics.logEvent(name: eventName);
//   }
//
//   Future logScreenView({required String screenName}) async {
//     _analytics.logScreenView(
//       screenName: screenName
//     );
//   }
//
//   FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);
//
// }