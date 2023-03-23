import 'dart:convert';
import 'dart:io';

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

  Future<dynamic> updateProfile(UpdateUserProfileRequestBody updateUserProfileRequestBody)async{
    http.Response responseStatus;

    try{
      final response=await http.post(Uri.parse(ApiBaseUrl.baseUrl+ApiEndPoint.updateProfile),
          body: json.encode(updateUserProfileRequestBody.toJson()));

      responseStatus=response;
    }on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }

    return responseStatus;
  }
  
}