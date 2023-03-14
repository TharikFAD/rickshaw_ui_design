// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/buttons.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/index_containers.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/phone_number_field.dart';
import 'package:meter_app/routes/route_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  child: PhoneField(),
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
