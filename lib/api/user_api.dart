import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:meter_app/api/api_helper.dart';
import 'package:meter_app/model/user_profile.dart';

import 'custom_exception.dart';


class UserAPI{

  dynamic result;
  Response? response;
  Map<String,dynamic>? data;

  Future<dynamic> updateProfile(UpdateProfileRequestBody updateProfileRequestBody)async{

    debugPrint('PROFILE UPDATE REQUEST ${updateProfileRequestBody.toJson()}');

    try{
      final response=await http.put(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.updateProfile),
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
    debugPrint('GET PROFILE REQUEST ');

    try{
      final response=await http.get(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.updateProfile),);

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