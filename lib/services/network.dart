// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData({required Map<String, String> body}) async {
    var rawData;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future getwithHeader({required Map<String, String> header}) async {
    var rawData;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: header);
      rawData = response.body;
      var data = jsonDecode(response.body);

      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future getProfileData({required Map<String, String> body}) async {
    var rawData;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future getProfileDatas({required Map<String, String> body}) async {
    var rawData;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future updateProfileData({required Map<String, String> head, body}) async {
    var rawData;
    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: head, body: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future putData({required Map<String, String> head, body}) async {
    var rawData;
    try {
      http.Response response =
          await http.put(Uri.parse(url), headers: head, body: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future putBodyData({required Map<String, String> head}) async {
    var rawData;
    try {
      http.Response response = await http.put(Uri.parse(url), headers: head);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future putBodyWithData(
      {required Map<String, String> head, var bodyData}) async {
    http.Response response =
        await http.put(Uri.parse(url), headers: head, body: bodyData);
    var data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> postData({required body}) async {
    print("Inside postData with body: $body");
    var rawData;
    try {
      // Map<String, String> headers = {
      //   'Content-Type': 'application/json',
      // };

      // Make the POST request
      http.Response response = await http.post(
        Uri.parse(url),
        //headers: headers,
        body: jsonEncode(body), // Encode body as JSON
      );

      rawData = response.body;
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: $rawData");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        // Handle error response
        return jsonDecode(response.body);
      }
    } on SocketException {
      return socketExceptionError(url);
    } on HttpException {
      return httpExceptionError(rawData: rawData, apiLInk: url);
    } on FormatException {
      return formatExceptionError(rawData: rawData, apiLInk: url);
    } catch (e) {
      print("Error in postData: $e");
      return {'error': e.toString()};
    }
  }

  // Future postData({required Map<String, String> body}) async {
  //   print("inside Post data with body: $body");
  //   var rawData;
  //   try {
  //     http.Response response = await http.post(Uri.parse(url), headers: body);
  //     rawData = response.body;
  //     var data = jsonDecode(response.body);
  //     return data;
  //   } on SocketException {
  //     var errorData = socketExceptionError(url);
  //     return errorData;
  //   } on HttpException {
  //     var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
  //     return errorData;
  //   } on FormatException {
  //     var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
  //     return errorData;
  //   }
  // }

  Future postHeaderData({required Map<String, String> headers}) async {
    var rawData;
    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future<dynamic> postHeaderBodyData(
      Map<String, String> headers, Map<String, String> body) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'error': 'Failed with status code: ${response.statusCode}',
          'message': response.body,
        };
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }


  // Future postHeaderBodyData(headers, body) async {
  //   var rawData;
  //   try {
  //     http.Response response =
  //         await http.post(Uri.parse(url), headers: headers, body: body);
  //     rawData = response.body;
  //     var data = jsonDecode(response.body);
  //     return data;
  //   } on SocketException {
  //     var errorData = socketExceptionError(url);
  //     return errorData;
  //   } on HttpException {
  //     var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
  //     return errorData;
  //   } on FormatException {
  //     var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
  //     return errorData;
  //   }
  // }

  Future patchData(headers, body) async {
    var rawData;
    try {
      http.Response response =
          await http.patch(Uri.parse(url), headers: headers, body: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future counterDeleteData({required Map<String, String> headers, body}) async {
    var rawData;
    try {
      http.Response response =
          await http.delete(Uri.parse(url), headers: headers, body: body);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future counterGetData({required Map<String, String> headers, body}) async {
    var rawData;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      rawData = response.body;
      var data = jsonDecode(response.body);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future uploadFileData({
    required String filePath,
  }) async {
    var rawData;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('images', filePath));
      var res = await request.send();
      final respStr = await res.stream.bytesToString();
      rawData = respStr;
      var data = jsonDecode(respStr);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future uploadCareer(
      String filePath,
      String fullName,
      String email,
      String mobile,
      String address,
      String message,
      String requirement,
      Map<String, String> headers) async {
    var rawData;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('cv', filePath));
      request.files.add(http.MultipartFile.fromString('name', fullName));
      request.files.add(http.MultipartFile.fromString('email', email));
      request.files.add(http.MultipartFile.fromString('mobile', mobile));
      request.files.add(http.MultipartFile.fromString('address', address));
      request.files.add(http.MultipartFile.fromString('message', message));
      request.files
          .add(http.MultipartFile.fromString('applied_for', requirement));
      request.headers.addAll(headers);
      var res = await request.send();
      final respStr = await res.stream.bytesToString();
      rawData = respStr;
      var data = jsonDecode(respStr);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future uploadDesign(String filePath, String fullName, String email,
      String mobile, String message, Map<String, String> headers) async {
    var rawData;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
      request.files.add(http.MultipartFile.fromString('name', fullName));
      request.files.add(http.MultipartFile.fromString('email', email));
      request.files.add(http.MultipartFile.fromString('mobile', mobile));
      request.files.add(http.MultipartFile.fromString('message', message));
      request.headers.addAll(headers);
      var res = await request.send();
      final respStr = await res.stream.bytesToString();
      rawData = respStr;
      var data = jsonDecode(respStr);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }

  Future updateAlbums(String tokenString, String titleString,
      String descriptionString, String status, var customFieldArray) async {
    var rawData;
    try {
      Map<String, String> headerParameters = {
        'Authorization': 'Bearer $tokenString',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request('PUT', Uri.parse(url));
      request.bodyFields.addAll(customFieldArray);
      request.headers.addAll(headerParameters);
      var res = await request.send();
      final respStr = await res.stream.bytesToString();

      rawData = respStr;
      var data = jsonDecode(respStr);
      return data;
    } on SocketException {
      var errorData = socketExceptionError(url);
      return errorData;
    } on HttpException {
      var errorData = httpExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    } on FormatException {
      var errorData = formatExceptionError(rawData: rawData, apiLInk: url);
      return errorData;
    }
  }
}

socketExceptionError(String apiLInk) async {
  var data = {
    "status": false,
    "success": 0,
    "errorAssets": 'assets/no_network.json',
    "msg": "No Network Connection"
  };
  sendCrashData(apiLInk);
  await FirebaseCrashlytics.instance.recordError(
      'No Network Connection', StackTrace.current,
      reason: 'as Network Connection is disabled', fatal: true);
  return data;
}

httpExceptionError({var rawData, required String apiLInk}) async {
  var data = {
    "status": false,
    "success": 0,
    "msg": "No Server Response",
    "errorAssets": 'assets/error.json',
  };
  sendCrashData(apiLInk);
  FirebaseCrashlytics.instance.log("Received Data : $rawData");
  await FirebaseCrashlytics.instance.recordError(
      'HTTP Response Error', StackTrace.current,
      reason: 'as Server Received Data is invalid', fatal: true);
  return data;
}

Future<Map> formatExceptionError({var rawData, required String apiLInk}) async {
  var data = {
    "status": false,
    "success": 0,
    "errorAssets": 'assets/error.json',
    "msg": "Server Error,\nPlease try later"
  };
  sendCrashData(apiLInk);
  FirebaseCrashlytics.instance.log("Received Data : $rawData");
  await FirebaseCrashlytics.instance.recordError(
      'Format Error', StackTrace.current,
      reason: 'as Server Received Data Contain Error', fatal: true);
  return data;
}
