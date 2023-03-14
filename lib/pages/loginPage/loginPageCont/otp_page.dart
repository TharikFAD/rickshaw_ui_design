// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/buttons.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/index_containers.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/otp_field.dart';
import 'package:meter_app/routes/route_name.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
                  child: OtpField(),
                ),

                SizedBox(
                  height: size.height * 0.1,
                ),

                //Next Button
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: ButtonWidget(
                      text: 'Next',
                      callback: () {
                        Navigator.pushNamed(context, enterUserNameScreenRoute);
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
