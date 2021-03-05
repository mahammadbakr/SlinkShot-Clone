import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postHTTP(
    {String url, Map<String, dynamic> body}) async {
  // Map<String, String> headers = {
  //   'Content-Type': 'application/json',
  // };
  final bodyJson = jsonEncode(
    body,
  );
  var response = await http.post(
    url,
    body: bodyJson,
  );

  // bool isPass =  handleError(jsonDecode(response.body)["code"].toString());

  // if (isPass) {
    return jsonDecode(response.body);
  // } else {
  //   print(response);
  //   return null;
  // }
}

bool handleError(String code)  {
  if (code == "200") {
    print("STATUS CODE IS:: SUCCESS");
    return true;
  } else if (code == "401") {
    print("STATUS CODE IS:: ERROR AUTHENTICATION");
    return false;
  } else if (code == "500") {
    print("STATUS CODE IS:: ERROR JSON FORMAT");
    return false;
  } else if (code == "403") {
    print("STATUS CODE IS:: ERROR HEADER INFO");
    return false;
  }  else if (code == "440") {
    print("STATUS CODE IS:: UNKNOWN");
    return false;
  } else {
    return false;
  }
}
