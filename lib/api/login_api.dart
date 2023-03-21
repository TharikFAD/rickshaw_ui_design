import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meter_app/model/otp.dart';

import 'api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'custom_exception.dart';

class LogInAPI{
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;


  Future<dynamic> sendOtp(OtpRequestBody otpRequestBody) async {

    debugPrint('LOGIN API REQUEST : ${otpRequestBody.toJson()}');
    http.Response responseStatus;

    try {
      final response = await http.post(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.sendOtp),
        body: json.encode(otpRequestBody.toJson()),
      );
      debugPrint('LOGIN API RESPONSE : ${response.body}');
      responseStatus = response;

    } on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return responseStatus;
  }

  Future<dynamic> validateOtp(ValidateOtpRequestBody validateOtpRequestBody)async{
    debugPrint('LOGIN API REQUEST : ${validateOtpRequestBody.toJson()}');
    http.Response responseStatus;

    try {
      final response = await http.post(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.validateOtp),
        body: json.encode(validateOtpRequestBody.toJson()),
      );
      debugPrint('LOGIN API RESPONSE : ${response.body}');
      responseStatus=response;


    } on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return responseStatus;
  }



}