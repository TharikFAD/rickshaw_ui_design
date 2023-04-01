// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/trip_api.dart';
import 'package:meter_app/model/trip_history.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';

import '../../routes/route_name.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  var tripAPI=TripAPI();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'TRIP HISTORY',
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
      ) ,
      drawer: MyDrawerWidget(),
      body: Column(
        children: [
          FutureBuilder(
            future:tripAPI.getTripHistory(),
            builder: (context,snapshot) {
              if(!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else{
                var res=TripHistoryResponse.fromJson(snapshot.data);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: res.result?.length,
                  itemBuilder: (context,index) {
                    return Padding(
                    padding: const EdgeInsets.only(
                      top: 14.0,
                      left: 14.0,
                      right: 14.0,
                    ),
                    child: Container(
                      height: size.height * 0.25,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(
                              0.0,
                              0.0,
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
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 12),
                              child: Row(
                                children: [
                                  Image.asset('assets/Driving.png'),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Date :',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    res.result![index]!.tripDate!,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 12),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Image.asset('assets/reddot.png'),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Pickup :',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Flexible(
                                    child: Text(
                                      res.result![index]!.pickupAddress!,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 12),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Image.asset('assets/greendot.png'),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Drop :',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Flexible(
                                    child: Text(
                                      res.result![index]!.dropAddress!,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 12),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF4885ED),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.popAndPushNamed(context, addCompaintScreenRoute,arguments: res.result![index]!.tripId);
                                    },
                                    child: Text('Report'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ); },
                );
              }
            },),
        ],
      ),
    );
  }
}
