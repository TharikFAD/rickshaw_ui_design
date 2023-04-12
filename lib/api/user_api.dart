import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:meter_app/api/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../model/user/update_user_request.dart';
import 'custom_exception.dart';


class UserAPI{

  dynamic result;
  Response? response;
  Map<String,dynamic>? data;

  Future<dynamic> updateProfile(UpdateProfileRequestBody updateProfileRequestBody)async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      String? driverId=pref.getString('identification_key');
    debugPrint('PROFILE UPDATE REQUEST ${updateProfileRequestBody.toJson()}');

    try{
      final response=await http.put(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.updateProfile).replace(queryParameters: {'IdentificationKey':driverId}),
          body: json.encode(updateProfileRequestBody.toJson()));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
      debugPrint('PROFILE UPDATE RESPONSE ${response.body}');
    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

    return result;
  }



  Future<dynamic> getProfile()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var driverId=pref.getString('identification_key');
    debugPrint('GET PROFILE REQUEST $driverId');

    try{
      final response=await http.get(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.getProfile).replace(queryParameters: {
        "identification_key":driverId
      }),);

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
      debugPrint('GET PROFILE RESPONSE ${response.body}');
    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

    return result;
  }
  
}