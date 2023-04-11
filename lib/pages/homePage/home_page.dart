// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/chat_head.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/routes/route_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _offset = Offset.zero;
  var _isStarted = false;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(10.9641042, 76.9562562);
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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getCurrentLocation().then((value) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 17.0,
          ),
        ),
      );
    });
  }

  final bool _mapStarted = false;
  final GlobalKey _parentKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Drawer
      drawer: MyDrawerWidget(),

      //Body
      body: Stack(
        children: [
          //GoogleMap
          GoogleMap(
            padding: EdgeInsets.only(top: 100),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(target: _center, zoom: 17.0),
          ),

          //Appbar
          Column(
            children: [
              CustomAppBar(),
            ],
          ),

          //Button thingy New Start
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 2.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(size.width * 0.8, size.height * 0.07),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                      ),
                      onPressed: () {
                        _dialogBuilder(context);
                      },
                      child: Text(
                        'Start Ride',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //chat_head.dart
          //I've used Visiblity for showing the icon on the system home screen
          // we should apply the system alert window's property as the parameter
          Visibility(
            visible: false,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                key: _parentKey,
                children: [
                  Container(color: Colors.transparent),
                  DraggableFloatingActionButton(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.transparent),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            "assets/ic_launcher.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    initialOffset: const Offset(120, 70),
                    parentKey: _parentKey,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
          'Do you want to start the ride?',
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
              Navigator.pushNamed(context, completeRideScreenRoute);
            },
          ),
        ],
      );
    },
  );
}
