import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      return dotenv.get(key);
    } catch (e) {
      // Return empty string for web deployment when .env is not available
      return '';
    }
  }
}
