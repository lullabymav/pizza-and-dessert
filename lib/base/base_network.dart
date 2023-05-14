import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://pizza-and-desserts.p.rapidapi.com";
  static final key = '014e1274d4msh92616d462e08163p11eeabjsn372db3b2da98';

  static Future<List<dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(
      Uri.parse(fullUrl),
      headers: {
        'X-RapidAPI-Key': key,
        'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
      }
    );
    debugPrint("BaseNetwork - response : ${response.statusCode}");
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<List<dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return [];
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}