// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field, prefer_const_declarations, unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/inc_dec_button.dart';
import 'package:meter_app/pages/homePage/widgets/slider.dart';
import 'package:meter_app/routes/route_name.dart';

class CompleteRidePage extends StatefulWidget {
  const CompleteRidePage({super.key});

  @override
  State<CompleteRidePage> createState() => _CompleteRidePageState();
}

const notificationChannelId = 'my_foreground';
const notificationId = 888;

Future<void> onStart(ServiceInstance serviceInstance) async {
  late StreamSubscription<Position> _positionStream;
  late List<Position> _positionHistory;
  DateTime startTime=DateTime.now();



  _positionHistory = [];
  _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 1))
      .listen((Position position) {
    _positionHistory.add(position);
    double travelled_km = 0;
    for (int i = 0; i < _positionHistory.length - 1; i++) {
      travelled_km += Geolocator.distanceBetween(
          _positionHistory[i].latitude,
          _positionHistory[i].longitude,
          _positionHistory[i + 1].latitude,
          _positionHistory[i + 1].longitude);
    }

    //send data to isolate

    Map<String, dynamic> dataToSend = {};
    dataToSend['travelled_km'] = '$travelled_km,$startTime';
    serviceInstance.invoke('km', dataToSend);
    debugPrint("MANI KM  ISOLATE $dataToSend");
  });

  //receivedata to isolate
  serviceInstance.on("stop").listen((event) {
    double distance = 0;
    for (int i = 0; i < _positionHistory.length - 1; i++) {
      distance += Geolocator.distanceBetween(
          _positionHistory[i].latitude,
          _positionHistory[i].longitude,
          _positionHistory[i + 1].latitude,
          _positionHistory[i + 1].longitude);
    }

    if (event!['action'] == 'stopservice') {
      //senddata from isolate to main
      Map<String, dynamic> dataToSend = {'count': distance};
      serviceInstance.invoke('data', dataToSend);
      print("MANI data to Send $dataToSend");
    }
  });
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration());
}


class _CompleteRidePageState extends State<CompleteRidePage> {

  late Position _currentPosition;
  late StreamSubscription<Position> _positionStream;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(10.9641042, 76.9562562);
  
  double travelledKm = 0;
  DateTime? startTime;
  DateTime? endTime;
  Duration? difference;
  int? totalMinutes;
  int? remainingSeconds;

  

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
      _positionStream=Geolocator.getPositionStream().listen((event) {
        setState(() {
          mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(event.longitude,event.longitude),zoom: 17)));
        });

      });
    }

     @override
      void initState() {
        super.initState();
        initializeService();
      }
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    endTime = DateTime.now();

    debugPrint("MANI ENDTIME MAIN:$endTime");
    FlutterBackgroundService().on('km').listen((event) {
      if (event!['travelled_km'] != null) {
        var value = event!['travelled_km'].toString().split(',');
        travelledKm=double.parse(value[0]);
        startTime=DateTime.parse(value[1]);
        Duration difference = endTime!.difference(startTime!);
         totalMinutes = difference.inMinutes;
         remainingSeconds = difference.inSeconds % 60;

        debugPrint("MANI KM MAIN1:${travelledKm},$value");
      }

      setState(() {
        travelledKm = (travelledKm == 0) ? 0 : (travelledKm / 1000);
        travelledKm = double.parse(travelledKm.toStringAsFixed(2));
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AUTO KAARAN',
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
      //drawer
      drawer: MyDrawerWidget(),

      //body
      body: Container(
        child: Stack(
          children: [
            //GoogleMap
            GoogleMap(
              padding: EdgeInsets.only(top:100),
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _center, zoom: 17.0),
            ),
            //On swipe Panel
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.705,
                ),
                Center(
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dy > sensitivity) {
                        // Down Swipe
                      } else if (details.delta.dy < -sensitivity) {
                        // Up Swipe
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  //Color(0xFFd9d9d9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                height: size.height * 0.4,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      Text(
                                        'Surge Price',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),

                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      //MySlider(),
                                      IncDecButtonWidget(),
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),

                                      //Complete button
                                      Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize: MaterialStateProperty.all(
                                              Size(size.width * 0.8,
                                                  size.height * 0.07),
                                            ),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                          ),
                                          onPressed: () {
                                            _dialogBuilder(context);
                                          },
                                          child: Text(
                                            'Complete Ride',
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  //Color(0xFFd9d9d9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                height: size.height * 0.4,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      Text(
                                        'Surge Price',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),

                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      IncDecButtonWidget(),
                                      //MySlider(),
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),

                                      //button
                                      Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize: MaterialStateProperty.all(
                                              Size(size.width * 0.8,
                                                  size.height * 0.07),
                                            ),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                          ),
                                          onPressed: () {
                                            _dialogBuilder(context);
                                          },
                                          child: Text(
                                            'Complete Ride',
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: size.height * 0.172,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: // Colors.white,
                              Color(0xFFd9d9d9),
                          //border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${travelledKm} KM',
                                  style: GoogleFonts.inter(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                                Icon(Icons.keyboard_arrow_up),
                                Text(
                                  '${totalMinutes}:${remainingSeconds}',
                                  style: GoogleFonts.inter(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Complete button
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.78,
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
                    onPressed: () {
                      _dialogBuilder(context);
                    },
                    child: Text(
                      'Complete Ride',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //OnRide Fare Meter
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                //this one is required for future use to show fare
                // Center(
                //   child: Container(
                //     height: size.height * 0.07,
                //     width: size.width * 0.5,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(25),
                //       border: Border.all(color: Color(0xFF4885ED), width: 5),
                //     ),
                //     child: Center(
                //         child: Text(
                //       '₹ 99.25',
                //       style: GoogleFonts.inter(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     )),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _positionStream.cancel();
  }

  //Complete Ride Dialog Box-------------------------------------------------------->
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to stop the ride?',
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
                Navigator.popAndPushNamed(context, riderInfoScreenRoute);
              },
            ),
          ],
        );
      },
    );
  }


}


