// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:crypto/crypto.dart';

// Initialize client
class Configuration {
  static const MERCHANT_CODE = '255060414833';
  static const MERCHANT_KEY = 'DOEGZeWhw9[=)Ua@*A]r';
  static const URL = 'https://api.2checkout.com/rpc/6.0';
  static const ACTION = 'getVendorPaymentMethodCurrencies';
  static const ADDITIONAL_OPTIONS = null;
  static const PAYLOAD = ['WIRE', 'FR'];
}

class Client {
  static const LOGIN_METHOD = 'login';
  int calls = 1;
  String sessionId = '';

  Map<String, dynamic> generateAuth() {
    const merchantCode = Configuration.MERCHANT_CODE;
    const key = Configuration.MERCHANT_KEY;
    final date = DateTime.now().toUtc().toString();
    final string = '${merchantCode.length}$merchantCode${date.length}$date';
    final hash =
        Hmac(sha256, utf8.encode(key)).convert(utf8.encode(string)).toString();
    return {'merchantCode': merchantCode, 'date': date, 'hash': hash};
  }

  Future<void> login(String url) async {
    final payload = generateAuth();
    final response = await call(url, payload.values.toList(), LOGIN_METHOD);
    sessionId = response!['result'];
  }

  Future<Map<String, dynamic>?> call([
    String url = Configuration.URL,
    dynamic payload = Configuration.PAYLOAD,
    String action = Configuration.ACTION,
  ]) async {
    if (sessionId == null && action != LOGIN_METHOD) {
      await login(url);
    }

    if (payload is String) {
      payload = jsonDecode(payload);
    }

    if (payload is List) {
      payload = [sessionId, ...payload];
    } else {
      payload = [sessionId, payload];
    }
  
    payload = payload.where((item) => item != null).toList();

    final request = jsonEncode({
      'jsonrpc': '2.0',
      'method': action,
      'params': payload,
      'id': calls++,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'XDEBUG_SESSION=PHPSTORM',
        'Access-Control-Allow-Headers': 'Origin',
      },
      body: request,
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Server unavailable');
    }

    print(response.body);
    return jsonDecode(response.body);
  }
}

Future newCustomAction() async {
  final client = Client();
  final result = await client.call();
  return result;
}
