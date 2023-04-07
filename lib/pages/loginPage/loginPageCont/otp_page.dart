// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/buttons.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/index_containers.dart';

import 'package:meter_app/api/login_api.dart';
import 'package:meter_app/model/otp.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var otp;
  var validateOtpRequestBody = ValidateOtpRequestBody();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '1'),
                      IndexContainer(bgColor: Color(0xFF4885ED), text: '2'),
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '3'),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                ),

                //OTP has been sent -msg
                Text(
                  'We sent you an OTP to verify your number',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                //Otp Field
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 30,
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w700),
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      setState(() {
                        otp = pin;
                      });
                      print("Completed: " + pin);
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
                      callback: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        var mobileNo = pref.getInt('mobile_no');
                        otp = int.parse(otp);
                        validateOtpRequestBody.phone = mobileNo;
                        validateOtpRequestBody.otp = otp;

                        LogInAPI()
                            .validateOtp(validateOtpRequestBody)
                            .then((value) async {
                          if (value.statusCode == 200) {
                            var validateResponse = ValidateOtpResponse.fromJson(
                                jsonDecode(value.body));

                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString("identification_key", validateResponse.result!.data!.identificationKey!);
                            pref.setString("magik_link", validateResponse.result!.data!.magicLink!);

                            debugPrint("OTP PAGE: ${validateResponse.result?.data?.magicLink}");
                            Fluttertoast.showToast(msg: validateResponse!.result!.Messsage!);
                            Navigator.pushNamed(context, enterUserNameScreenRoute);
                          }else{
                            Fluttertoast.showToast(msg: "Login Failed");
                          }

                        });


                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
