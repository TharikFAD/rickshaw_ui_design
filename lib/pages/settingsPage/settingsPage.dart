// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/Pages/loginPage/widgets/user_name_textform.dart';
import 'package:meter_app/api/user_api.dart';
import 'package:meter_app/model/otp.dart';
import 'package:meter_app/model/user/get_user_response.dart';
import 'package:meter_app/pages/HomePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/login_api.dart';
import '../../model/user/update_user_request.dart';
import '../../model/user/update_user_response.dart';
import '../../routes/route_name.dart';


class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  var UserNameController = TextEditingController();
  var DriverIdController = TextEditingController();
  var MobileNumberController = TextEditingController();
  var VehicleNumberController = TextEditingController();

  var userAPI=UserAPI();

  var otpRequestBody = OtpRequestBody();
  var otp;
  var updateProfile = UpdateProfileRequestBody();

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'SETTINGS PAGE',
          style: GoogleFonts.bungee(fontSize: 22, fontWeight: FontWeight.w400),
        ), //appbar title
        backgroundColor: Color(0xFF4885ED), //appbar background color

        actions: [
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, homeScreenRoute);
            },
            child: Icon(
              Icons.home,
              size: 32,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      //Drawer
      drawer: MyDrawerWidget(),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  controller: UserNameController, hintText: ''),
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

            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: UserNameTextForm(
                  controller: DriverIdController, hintText: ''),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            //Vehicle no
            Padding(
              padding: const EdgeInsets.only(
                left: 51.0,
              ),
              child: Row(
                children: [
                  Text(
                    'Enter Your Vehicle No',
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
                  controller: VehicleNumberController, hintText: ''),
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
                  controller: MobileNumberController, hintText: ''),
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
                      otpRequestBody.phone =
                          int.parse(MobileNumberController.text.trim());
                      otpRequestBody.countryCode = '+91';
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

            //Save button
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(size.width * 0.8, size.height * 0.07),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    ),
                    onPressed: () async {
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
                SharedPreferences pref = await SharedPreferences.getInstance();
                var identificationKey = pref.getString('identification_key');
                var driverId = DriverIdController.text.trim();
                var driverName = UserNameController.text.trim();
                var vehicleNumber=VehicleNumberController.text.trim();
                var mobileNo = MobileNumberController.text.trim();
                var Otp = otp;

                updateProfile.driverId = driverId;
                updateProfile.name = driverName;
                updateProfile.vehicleNumber=vehicleNumber;



                debugPrint("SETTINGS PAGE ${updateProfile.toJson()}");

                UserAPI().updateProfile(updateProfile).then((value) async {
                  debugPrint("SETTINGS PAGE ${value}");

                  var res = UpdateProfileResponse.fromJson(value);
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
              hintText: '',
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

  void getUserData() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? driverName=pref.getString('userName');
    if(driverName != null){
      DriverIdController.text=driverName;
    }

    userAPI.getProfile().then((value) {
      var res=GetUserResponse.fromJson(value);
      UserNameController.text=res.result!.data!.name!;
      DriverIdController.text=res.result!.data!.driverId!.toString();
      VehicleNumberController.text=res.result!.data!.vehicleNumber!.toString();
      MobileNumberController.text=res.result!.data!.phone!.toString();

    });

  }
}
