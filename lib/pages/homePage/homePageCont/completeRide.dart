// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field, prefer_const_declarations, unnecessary_new, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/api/trip_api.dart';
import 'package:meter_app/core/isolate_service.dart';
import 'package:meter_app/model/trip/trip_complete_request.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/inc_dec_button.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/trip/trip_complete_response.dart';

class CompleteRidePage extends StatefulWidget {
  const CompleteRidePage({super.key});

  @override
  State<CompleteRidePage> createState() => _CompleteRidePageState();
}

class _CompleteRidePageState extends State<CompleteRidePage> {
  late Position _currentPosition;
  late StreamSubscription<Position> _positionStream;
  late GoogleMapController mapController;
  bool isCameraMoving = false;
  LatLng _currentLatLng = LatLng(11.015509774402489, 76.94085591088329);

  double latitude = 11.015509774402489;
  double longitude = 76.94085591088329;

  var completeTripAPI = TripAPI();
  var tripCompleteResponse = TripCompleteResponse();

  double travelledKm = 0;
  DateTime? startTime;
  DateTime? endTime;
  Duration? difference;
  int? totalMinutes;
  int? remainingSeconds;

  @override
  void initState() {
    super.initState();
    debugPrint('INSIDE COMPLETE RIDE PAGE INIT');
    IsolateService().initializeService();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    endTime = DateTime.now();
    debugPrint("MANI ENDTIME MAIN:$endTime");

    FlutterBackgroundService().on('km').listen((event) {
      if (event!['travelled_km'] != null) {
        var value = event!['travelled_km'].toString().split(',');

        travelledKm = double.parse(value[0]);
        startTime = DateTime.parse(value[1]);
        String latitudeString = value[2].split(':')[1].trim();
        latitude = double.parse(latitudeString);
        String longitudeString = value[3].split(':')[1].trim();
        longitude = double.parse(longitudeString);

        difference = endTime!.difference(startTime!);
        totalMinutes = difference!.inMinutes;
        remainingSeconds = (difference?.inSeconds)! % 60;

        debugPrint("MANI KM MAIN1:$travelledKm,lat:$latitude,lon:$longitude");
      }

      setState(() {
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(latitude, longitude), zoom: 17.0)));
        travelledKm = (travelledKm == 0) ? 0 : (travelledKm / 1000);
        travelledKm = double.parse(travelledKm.toStringAsFixed(2));
      });
    });

    return Scaffold(
      //drawer
      drawer: MyDrawerWidget(),
      //body
      body: Container(
        child: Stack(
          children: [
            //GoogleMap
            GoogleMap(
              padding: EdgeInsets.only(top: 100),
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(latitude, longitude), zoom: 17.0),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            //On swipe Panel
            Column(
              children: [
                Spacer(),
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
                                            fixedSize:
                                                MaterialStateProperty.all(
                                              Size(size.width * 0.8,
                                                  size.height * 0.09),
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
                                            fixedSize:
                                                MaterialStateProperty.all(
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
                        height: size.height * 0.170,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Icon(Icons.keyboard_arrow_up),
                                Text(
                                  '${(totalMinutes == null) ? 0 : totalMinutes}:${(remainingSeconds == null) ? 0 : remainingSeconds} m:s',
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
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
                  height: size.height * 0.9,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(size.width * 0.8, size.height * .01),
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

            //OnRide Fare Meter and Complete Button
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.5,
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
            ),
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

  void _onMapCreated() async {
    _positionStream = Geolocator.getPositionStream().listen((event) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.longitude, event.longitude), zoom: 17)));
    });

    // _positionStream = Geolocator.getPositionStream().listen((event) {
    //   setState(() {
    //     mapController.animateCamera(CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //             target: LatLng(longitude!,longitude!), zoom: 17)));
    //
    //   });
    //
    // });
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
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                var driverId = pref.getString('identification_key');
                var surgeValue = pref.getDouble('surgePrice');
                surgeValue ??= 1;
                TripCompleteRequestBody tripCompleteRequestBody =
                    TripCompleteRequestBody(
                        identificationKey: driverId,
                        fareId: 1,
                        startTime: startTime.toString(),
                        endTime: endTime.toString(),
                        origin: TripCompleteRequestBodyOrigin(
                          latitude: "10.970125",
                          longitude: "76.951640",
                        ),
                        destination: TripCompleteRequestBodyDestination(
                          latitude: "10.978840",
                          longitude: "76.961304",
                        ),
                        readings: TripCompleteRequestBodyReadings(
                          kmTravelled: (travelledKm * 1000),
                          waitingTime: difference?.inSeconds,
                          surgeValue: surgeValue,
                        ));

                debugPrint('COMPLETE ${tripCompleteRequestBody}');

                Map<String, dynamic> dataToSend = {};
                dataToSend['action'] = 'stopService';
                FlutterBackgroundService().invoke('stop', dataToSend);
                FlutterBackgroundService().on('afterStop').listen((event) {
                  if (event!['message'] != null) {
                    Fluttertoast.showToast(msg: event!['message'].toString());
                  }
                });

                completeTripAPI
                    .tripComplete(tripCompleteRequestBody)
                    .then((value) {
                  tripCompleteResponse = TripCompleteResponse.fromJson(value);

                  if (tripCompleteResponse.status == "Success") {
                    Navigator.popAndPushNamed(context, riderInfoScreenRoute,
                        arguments: tripCompleteResponse);
                  } else {
                    Fluttertoast.showToast(
                        msg: "${tripCompleteResponse.message}");
                  }
                  //Fluttertoast.showToast(msg: tripCompleteResponse.message!);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
