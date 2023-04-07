

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meter_app/model/fare/create_fare.dart';
import 'package:meter_app/model/fare/update_fare_request.dart';

import '../model/fare/get_fare_response.dart';
import 'api_helper.dart';
import 'custom_exception.dart';

class FareAPI{
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;

  Future<dynamic> createFare(CreateFareRequestBody createFareRequestBody) async{
    debugPrint("CREATE FARE  API ${createFareRequestBody.toJson()}");
    http.Response responseStatus;

    try{

      final response=await http.post(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.createFare),
          body: json.encode(createFareRequestBody.toJson()));
      debugPrint('CREATE FARE  API RESPONSE : ${response.body}');
      responseStatus = response;

    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

   return responseStatus;
  }

  Future<dynamic> getFareByDriverId(driverId) async{
    debugPrint("GET FARE REQUEST FOR DRIVERID $driverId");
    try{
        final response = await http.get(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.getFare).replace(queryParameters: {'driverId':'$driverId'}));

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
  Future<dynamic> getFareByFareId(fareId) async{

    debugPrint("GET FARE REQUEST FOR FAREID $fareId");
    try{
      final response = await http.get(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.getFare).replace(queryParameters: {'FareID':'$fareId'}));

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

  Future<dynamic> updateFare(UpdateFareRequestBody updateFareRequestBody) async{
    debugPrint("UPDATE FARE REQUEST ${updateFareRequestBody.toJson()}");
    try{

      final response = await http.put(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.updateFare));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
      debugPrint("UPDATE FARE RESPONSE ${response.body}");

    }on SocketException{
      Fluttertoast.showToast(msg: 'No Internet connection. Please Try Again Later!');
      throw FetchDataException('No Internet connection');
    }

    return result;

  }
}