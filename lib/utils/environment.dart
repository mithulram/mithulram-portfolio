import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class Environment {
  static String get envFile => '.env';

  static String get serviceId => _getEnvVar('EMAIL_JS_SERVICE_ID');
  static String get templateId => _getEnvVar('EMAIL_JS_TEMPLATE_ID');
  static String get publicKey => _getEnvVar('EMAIL_JS_PUBLIC_KEY_ID');
  static String get privateKey => _getEnvVar('EMAIL_JS_PRIVATE_KEY_ID');
  static String get notificationTemplateId =>
      _getEnvVar('EMAIL_JS_NOTIFICATION_TEMPLATE_ID');
  static String get autoReplyTemplateId =>
      _getEnvVar('EMAIL_JS_AUTOREPLY_TEMPLATE_ID');

  static String _getEnvVar(String key) {
    try {
      // For web deployment, we need to handle this differently
      if (kIsWeb) {
        // Add your EmailJS credentials here for web deployment
        switch (key) {
          case 'EMAIL_JS_SERVICE_ID':
            return 'service_y4j9o3s';
          case 'EMAIL_JS_TEMPLATE_ID':
            return 'template_as4jfzb'; // Using notification template as default
          case 'EMAIL_JS_PUBLIC_KEY_ID':
            return 'zqdRR9or9HFvVA9yO';
          case 'EMAIL_JS_PRIVATE_KEY_ID':
            return 'IFQCl2z8s1uzhKhYoox_x';
          case 'EMAIL_JS_NOTIFICATION_TEMPLATE_ID':
            return 'template_as4jfzb';
          case 'EMAIL_JS_AUTOREPLY_TEMPLATE_ID':
            return 'template_1yjj5ve';
          default:
            return '';
        }
      } else {
        // For local development, use .env file
        return dotenv.get(key);
      }
    } catch (e) {
      // Return empty string for web deployment when .env is not available
      return '';
    }
  }
}
