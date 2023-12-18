import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_app/api_helper/api_exceptiion_handler.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  //TODO GetAPI calling only URL
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

  //TODO GetAPI with URL and Request parameter like Search
  static Future<dynamic> getApiWithParameterRequest(
      {required String strUrl,
      String? query,
      Map<String, String>? param}) async {
    var mDataGetM;
    try {
      var url = Uri.parse("$strUrl$query");
      var response = await http.get(
        url,
        headers: param,
      );
      print("getData ${response.body}");
      mDataGetM = returnDataResponse(response);
    } on SocketException {
      throw InvalidInputException(
          body: "Error while communicating with server");
    }

    return mDataGetM;
  }

  //TODO GetAPI with URL and Request parameter like Search
  static Future<dynamic> getApiWithHeader(
      {required String strUrl, Map<String, String>? param}) async {
    var mDataGetM;
    try {
      var url = Uri.parse(strUrl);
      var response = await http.get(url, headers: param);
      mDataGetM = returnDataResponse(response);
      print("mData ===>$mDataGetM");
    } on SocketException {
      throw InvalidInputException(
          body: "Error while communicating with server");
    }

    return mDataGetM;
  }

  //TODO POST Api with body header URL  && with Exception handling
  static Future<dynamic> postApiWithParameterAuth(
      {required String strURL,
      Map<String, dynamic>? body,
      Map<String, String>? mHeader}) async {
    var mData;
    try {
      var url = Uri.parse(strURL);
      var response = await http.post(url, headers: mHeader, body: body);
      mData = returnDataResponse(response);
      print("response===> $mData");
    } on SocketException {
      throw InvalidInputException(
          body: "Error while communicating with server");
    }
    return mData;
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

  static dynamic returnDataResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var res = response.body;
        // print("Get Response from api 200 ok  ====> $res");
        return jsonDecode(res);

      case 400:
        print("400");
        throw BadRequestException(body: response.body.toString());
      case 401:
      case 403:
        print("403,401");
        throw UnAuthorisedException(body: response.body.toString());
      case 500:
      default:
        print("500");
        throw InvalidInputException(
            body: "Error while communicating with server");
    }
  }
}
