// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/Pages/loginPage/widgets/user_name_textform.dart';
import 'package:meter_app/api/user_api.dart';
import 'package:meter_app/model/otp.dart';
import 'package:meter_app/model/user_profile.dart';
import 'package:meter_app/pages/HomePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/login_api.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  var UserNameController = TextEditingController();
  var DriverIdController = TextEditingController();
  var MobileNumberController = TextEditingController();
  var VehicleNumberController=TextEditingController();
  var otpRequestBody=OtpRequestBody();
  var otp;
  var updateProfile=UpdateProfileRequestBody();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  height: size.height * 0.02,
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
                  height: size.height * 0.02,
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
                  height: size.height * 0.01,
                ),
                //TextField -m "Enter your Name"
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: UserNameController,
                      hintText: 'UserName'),
                ),
                SizedBox(
                  height: size.height * 0.02,
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
                  height: size.height * 0.01,
                ),

                //TextField -m "Driver ID"
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: DriverIdController,
                      hintText: 'Driver ID'),
                ),

                //Change Mobile Number
                SizedBox(
                  height: size.height * 0.02,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 51.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Enter Vehicle Number',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),

                //TextField -m "Enter Mobile Number"
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: VehicleNumberController,
                      hintText: 'Vehicle Number ex:TN11AA1111'),
                ),
                SizedBox(
                  height: size.height * 0.02,
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
                  height: size.height * 0.01,
                ),

                //TextField -m "Enter Mobile Number"
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: MobileNumberController,
                      hintText: 'Mobile Number'),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),


                //Send OTP Text Button
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          otpRequestBody.phone=int.parse(MobileNumberController.text.trim());
                          otpRequestBody.countryCode='+91';
                          debugPrint("SETTINGS PAGE ${otpRequestBody.phone}");
                          LogInAPI().sendOtp(otpRequestBody);

                          _showOTPDialog(context);
                        },
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
          //Save button
          Column(
            children: [
              SizedBox(
                height: size.height * 0.91,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.8, size.height * 0.07),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () async{
                    _dialogBuilder(context);

                  },
                  child: Text(
                    'SAVE',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Save Changes?',
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
              onPressed: () async {
                SharedPreferences pref=await SharedPreferences.getInstance();
                var identificationKey=pref.getString('identification_key');
                var driverId=DriverIdController.text.trim();
                var driverName=UserNameController.text.trim();
                var mobileNo=MobileNumberController.text.trim();
                var vehicleNumber=VehicleNumberController.text.trim();
                var Otp=otp;

                updateProfile.identificationKey=identificationKey;
                updateProfile.driverId=driverId;
                updateProfile.name=driverName;
                updateProfile.phone=int.parse(mobileNo);
                updateProfile.otp=int.parse(Otp);
                updateProfile.vehicleNumber=vehicleNumber;

                debugPrint("SETTINGS PAGE ${updateProfile}");

                UserAPI().updateProfile(updateProfile).then((value) async{

                    debugPrint("SETTINGS PAGE ${value}");

                  var res=UpdateProfileResponse.fromJson(value);
                  Fluttertoast.showToast(msg: res.result!.Messsage!);


                });


                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showOTPDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter OTP'),
          content: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            onChanged: (value) {
              otp = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter OTP',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
                // Do something with the OTP entered
              },
            ),
          ],
        );
      },
    );
  }

}

