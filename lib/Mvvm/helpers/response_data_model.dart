import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

///This is generic response data model please modify it according to your API Structure.
///Model is designed to be generic please keep it that way
///Things to change:
///              1. Change data section - key where your data is.
///              2. Error and Messages -  key where your error, errors and message are.
///              3. okAndContainsData Condition - Change logic according to your API Structure
class ResponseData {
  int? statusCode;
  bool ok;
  bool okAndContainsData;
  var data;
  String? message;
  ResponseErrors? errors;
  String? rawResponseBody;

  ResponseData(
      {this.statusCode,
        this.data,
        this.message,
        this.errors,
        this.ok = false,
        this.okAndContainsData = false,
        this.rawResponseBody});

  factory ResponseData.fromResponse(http.Response response,
      {bool useBodyAsData = false}) {
    var parsedJson = jsonDecode(response.body);

    debugPrint("InResponseParse${response.body}");

    var result =  ResponseData(
      statusCode: response.statusCode,
      ok: (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204),
      data: useBodyAsData ? parsedJson : parsedJson['data'],
      rawResponseBody: response.body,
      okAndContainsData: (
          response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204 ) &&
          (useBodyAsData ? true : parsedJson['data'] != null),
      message: useBodyAsData ? null : parsedJson['message'] ?? "",
    );
    return result;
  }
}

class ResponseErrors {
  String message;

  ResponseErrors({
    required this.message,
  });

  factory ResponseErrors.fromJson(Map<String, dynamic> parsedJson) {
    return ResponseErrors(
      message: parsedJson['message'] ?? "",
    );
  }
}
