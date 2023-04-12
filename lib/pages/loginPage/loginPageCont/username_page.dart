// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/index_containers.dart';
import 'package:meter_app/Pages/LoginPage/Widgets/user_name_textform.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/buttons.dart';

class EnterUserNamePage extends StatefulWidget {
  const EnterUserNamePage({super.key});

  @override
  State<EnterUserNamePage> createState() => _EnterUserNamePageState();
}

class _EnterUserNamePageState extends State<EnterUserNamePage> {
  var UserNameController = TextEditingController();
  Position? _currentPosition;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  Future<Object?> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      debugPrint(" pos: $position");
      _currentPosition = position;
      return _currentPosition;

    } on PlatformException catch (e) {
      debugPrint("$e");
      getCurrentLocation();
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),

                //Index
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '1'),
                      IndexContainer(bgColor: Color(0xFFAEAEAE), text: '2'),
                      IndexContainer(bgColor: Color(0xFF4885ED), text: '3'),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.1,
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
                  height: size.height * 0.1,
                ),

                //User Name Field
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: UserNameTextForm(
                      controller: UserNameController,
                      hintText: 'Enter UserName'),
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //Next Button
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: ButtonWidget(
                    text: 'Next',
                    callback: () async{
                      SharedPreferences pref=await SharedPreferences.getInstance();
                      pref.setString('userName',UserNameController.text.toString() );
                      
                      Navigator.pushNamed(context, homeScreenRoute);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

