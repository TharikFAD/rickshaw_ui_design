

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_helper.dart';
import 'custom_exception.dart';
import 'package:http/http.dart' as http;

class TripAPI{
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;


  Future<dynamic> getTripHistory() async{

    SharedPreferences pref=await SharedPreferences.getInstance();
    //var driverId=pref.getString('identification_key');
    var driverId='azep0001';
    debugPrint("GET TRIP HISTORY REQUEST ");
    try{

      final response = await http.post(Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.getTriphistory).replace(queryParameters: {'DriverKey':'$driverId'}));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }

      debugPrint("GET TRIP HISTORY RESPONSE ${response.body}");

    }on SocketException{
      Fluttertoast.showToast(msg: 'No Internet connection. Please Try Again Later!');
      throw FetchDataException('No Internet connection');
    }

    return result;
  }
}