

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meter_app/model/create_fare.dart';

import 'api_helper.dart';
import 'custom_exception.dart';

class FareAPI{
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;

  Future<dynamic> createFare(CreateFareRequestBody createFareRequestBody) async{
    debugPrint("FARE CREATE API $createFareRequestBody");
    http.Response responseStatus;

    try{

      final response=await http.post(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.createFare),
          body: json.encode(createFareRequestBody.toJson()));
      debugPrint('FARE CREATE API RESPONSE : ${response.body}');
      responseStatus = response;

    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

   return responseStatus;
  }
}