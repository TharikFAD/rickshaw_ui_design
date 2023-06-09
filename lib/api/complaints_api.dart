import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:meter_app/api/api_helper.dart';
import 'package:meter_app/model/complaint/create_complaint_request.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'custom_exception.dart';


class ComplaintAPI{

  dynamic result;
  Response? response;
  Map<String,dynamic>? data;

  Future<dynamic> createComplaints(CreateComplaintRequestBody createComplaintRequestBody)async{

    debugPrint('CREATE COMPLAINT REQUEST ${createComplaintRequestBody.toJson()}');

    try{
      final response=await http.post(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.createComplaint),
          body: json.encode(createComplaintRequestBody.toJson()));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
      debugPrint('CREATE COMPLAINT RESPONSE ${response.body}');
    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

    return result;
  }

  Future<dynamic> getComplaints()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var driverId=pref.getString('identification_key');

    debugPrint('GET COMPLAINT REQUEST $driverId');

    try{
      final response=await http.get(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.getComplaint).replace(queryParameters: {'DriverKey':driverId}));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
      debugPrint('GET COMPLAINT RESPONSE ${response.body}');
    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

    return result;
  }

}