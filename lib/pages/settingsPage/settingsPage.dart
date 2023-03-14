// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/Pages/loginPage/widgets/user_name_textform.dart';
import 'package:meter_app/pages/HomePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  var UserNameController = TextEditingController();
  var DriverIdController = TextEditingController();
  var MobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //Drawer
      drawer: MyDrawerWidget(),

      //body
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //AppBar
                CustomAppBar(),

                SizedBox(
                  height: size.height * 0.05,
                ),

                //Profile Picture
                InkWell(
                  child: CircleAvatar(
                    radius: 50,
                    child: Center(
                      child: Image.asset(
                        'assets/Profile.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //Enter your name
                Padding(
                  padding: const EdgeInsets.only(
                    left: 51.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Enter Your Name',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: UserNameController,
                      hintText: 'Enter UserName'),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),

                //Driver ID
                Padding(
                  padding: const EdgeInsets.only(
                    left: 51.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Enter Your Driver ID',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: DriverIdController,
                      hintText: 'Enter Your Driver ID'),
                ),

                //Change Mobile Number
                SizedBox(
                  height: size.height * 0.05,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 51.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Change Mobile Number',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: MobileNumberController,
                      hintText: 'Enter Mobile Number'),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Send OTP',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          _dialogBuilder(context);
        },
        label: Text(
          'Save',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//Start Ride Dialog Box-------------------------------------------------------->
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Keep the changes?',
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000)),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'No',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'Yes',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
