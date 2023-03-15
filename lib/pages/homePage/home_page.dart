// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/completeRide.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/searchBar.dart';
import 'package:meter_app/routes/route_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isStarted = false;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(10.9641042, 76.9562562);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final bool _mapStarted = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //Drawer
      drawer: MyDrawerWidget(),

      //Body
      body: Stack(
        children: [
          //GoogleMap
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 17.0),
          ),

          Column(
            children: [
              CustomAppBar(),
            ],
          ),

          Column(
            children: [
              SizedBox(
                height: size.height * 0.18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 51.0, right: 51.0),
                child: SearchBarWidget(),
              ),
              SizedBox(
                height: size.height * 0.65,
              ),

              //Visibility thingy

              Visibility(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.5, size.height * 0.07),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    // setState(() {
                    //   _isStarted = true;
                    // });
                    Navigator.pushNamed(context, completeRideScreenRoute);
                  },
                  child: Text(
                    'Start Ride',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                visible: !_isStarted,
              ),

              Visibility(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.5, size.height * 0.07),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    setState(() {
                      _isStarted = false;
                    });
                  },
                  child: Text(
                    'Complete Ride',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                visible: _isStarted,
              ),
            ],
          ),
        ],
      ),

      //start button

      // floatingActionButton: FloatingActionButton.extended(
      //   isExtended: true,
      //   onPressed: () {
      //     _dialogBuilder(context);
      //   },
      //   label: Text(
      //     'Start Ride',
      //     style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
