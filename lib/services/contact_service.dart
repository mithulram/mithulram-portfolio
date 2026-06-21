import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactResult {
  const ContactResult.success()
      : success = true,
        message = null;

  const ContactResult.failure(this.message) : success = false;

  final bool success;
  final String? message;
}

class ContactService {
  ContactService({http.Client? client}) : _client = client ?? http.Client();

  static const apiUrl = String.fromEnvironment(
    'CONTACT_API_URL',
    defaultValue: '/api/contact',
  );

  final http.Client _client;

  Future<ContactResult> send({
    required String name,
    required String email,
    required String message,
    String? honeypot,
  }) async {
    final uri = _resolveUri(apiUrl);
    final response = await _client.post(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'message': message,
        if (honeypot != null && honeypot.isNotEmpty) 'website': honeypot,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return const ContactResult.success();
    }

    try {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final error = body['error']?.toString();
      if (error != null && error.isNotEmpty) {
        return ContactResult.failure(error);
      }
    } catch (_) {}

    return const ContactResult.failure(
      'Unable to send your message right now. Please email gmithulram@gmail.com directly.',
    );
  }

  Uri _resolveUri(String configuredUrl) {
    if (configuredUrl.startsWith('http')) {
      return Uri.parse(configuredUrl);
    }
    return Uri.base.resolve(configuredUrl);
  }
}
