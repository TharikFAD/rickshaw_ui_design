// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/buttons.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/index_containers.dart';
import 'package:meter_app/api/login_api.dart';
import 'package:meter_app/model/otp.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final phoneNoController = TextEditingController();
  var otpRequestBody=OtpRequestBody();
  var phoneNo;
  var countryCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),

                //index
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IndexContainer(bgColor: Color(0xFF4885ED), text: '1'),
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '2'),
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '3'),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.25,
                ),

                //Phone field
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: IntlPhoneField(
                    controller:phoneNoController ,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone){
                      setState(() {
                        phoneNo=phone.number;
                        countryCode=phone.countryCode.toString();
                      });
                      print(phone.number);
                    },

                  ),
                ),

                SizedBox(
                  height: size.height * 0.1,
                ),

                //Next Button
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: ButtonWidget(
                    text: 'Next',
                    callback: () async{
                     var mobileNo=int.parse(phoneNo);
                      SharedPreferences pref=await SharedPreferences.getInstance();
                      pref.setInt('mobile_no', mobileNo);

                      otpRequestBody.phone=mobileNo;
                      otpRequestBody.countryCode=countryCode;
                      debugPrint("LOGIN PAGE ${otpRequestBody.phone}");
                       var res=LogInAPI().sendOtp(otpRequestBody);
                       print("LOGIN NO: ${res}");
                      Navigator.pushNamed(context, enterOTPScreenRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
