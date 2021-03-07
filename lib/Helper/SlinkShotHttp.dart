import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postHTTP(
    {String url,
    Map<String, dynamic> body,
    Map<String, dynamic> header}) async {
  var response = await http.post(
    url,
    body: body,
  );

  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> getHTTP(
    {String url,
    Map<String, dynamic> body,
    Map<String, String> header}) async {
  var response = await http.get(url,  headers: header);

  return jsonDecode(response.body);
}
