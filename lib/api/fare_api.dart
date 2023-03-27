

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meter_app/model/create_fare.dart';

import '../model/get_fare.dart';
import 'api_helper.dart';
import 'custom_exception.dart';

class FareAPI{
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;

  Future<dynamic> createFare(CreateFareRequestBody createFareRequestBody) async{
    debugPrint("FARE CREATE API ${createFareRequestBody.toJson()}");
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

  Future<dynamic> getFare(id) async{

    debugPrint("GET FARE REQUEST");
    try{

        final response = await http.get(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.getFare).replace(queryParameters: {'fareId':'$id'}));

        if (response.statusCode == 200) {
          data = jsonDecode(response.body);
          result = data;
        } else if (response.statusCode == 400) {
        } else if (response.statusCode == 401) {
          //TODO
        }
        debugPrint("GET FARE RESPONSE ${response.body}");

    }on SocketException{
      Fluttertoast.showToast(msg: 'No Internet connection. Please Try Again Later!');
      throw FetchDataException('No Internet connection');
    }

    return result;
  }
}