import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get envFile => '.env';
  static String get serviceId => dotenv.get('EMAIL_JS_SERVICE_ID');
  static String get templateId => dotenv.get('EMAIL_JS_TEMPLATE_ID');
  static String get publicKey => dotenv.get('EMAIL_JS_PUBLIC_KEY_ID');
  static String get privateKey => dotenv.get('EMAIL_JS_PRIVATE_KEY_ID');
}