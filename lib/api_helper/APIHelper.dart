import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<dynamic> getApiRequest({required String strUrl}) async {
    var url = Uri.parse(strUrl);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  static Future<dynamic> getApiWithParameterRequest(
      {required String strUrl, required String query}) async {
    var url = Uri.parse("$strUrl$query");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  static Future<dynamic> postApiWithParameterAuth(
      {required String strURL, required Map<String, String> parameter}) async {
    var url = Uri.parse("$strURL$parameter");
    var response = await http.post(url, headers: parameter);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  static Future<dynamic> getApiWithParameterSearch(
      {required String strUrl,
      required String categoryName,
      int limitValue = 1,
      int offsetValue = 1}) async {
    var url =
        Uri.parse("$strUrl$categoryName?limit=$limitValue&offset=$offsetValue");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }
}
