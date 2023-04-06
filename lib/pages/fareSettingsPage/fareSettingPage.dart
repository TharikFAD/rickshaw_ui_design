// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/fare_api.dart';
import 'package:meter_app/model/fare/get_fare_response.dart';

import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homePage/widgets/drawer.dart';

class FareSettingsPage extends StatefulWidget {
  const FareSettingsPage({super.key});

  @override
  State<FareSettingsPage> createState() => _FareSettingsPageState();
}

class _FareSettingsPageState extends State<FareSettingsPage> {
  var driverId;
  bool _toggleValue = false;
  @override
  void initState() {
    super.initState();
    getDriverId();

  }
  var _isStarted = true;
  var fareAPI=FareAPI();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title: Text(
          'FARE SETTINGS',
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
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Contents => Middle Layer
            //EdgeInsets.only(top: 150, left: 12.0, right: 12.0),
            (driverId!=null)?Expanded(
              child: FutureBuilder(
                future: fareAPI.getFareByDriverId(driverId),
                builder:(context,snapshot){
                  if(!snapshot.hasData&& snapshot.connectionState ==
                      ConnectionState.waiting){
                    return Visibility(visible: _isStarted,child: Center(child: SizedBox(width:50,height:50,child: CircularProgressIndicator())));
                  }else if(snapshot.hasError){
                    return Text('An error occurred: ${snapshot.error}');
                  } else {
                    var res = GetFareResponse.fromJson(snapshot.data);
                    return RefreshIndicator(
                      backgroundColor: Colors.blueAccent,
                      displacement: 10,
                      onRefresh: () {
                        return Future.delayed(const Duration(seconds: 1), () {
                          setState(() {});
                        });
                      },
                      child: res.result!.data!.isEmpty?const Text('No Fare Available') :
                      ListView.builder(
                        shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: res.result?.data?.length,
                        itemBuilder:(context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, editFareScreenRoute,arguments: res.result!.data![index]!.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, left: 12.0, right: 12.0),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF4885ED),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    //Default
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Column(
                                        children: [
                                          Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12.0),
                                              child: Text(
                                                'Default',
                                                style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),),
                                            Spacer(),

                                            Switch(
                                              value: _toggleValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _toggleValue = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),



                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),

                                            //Base Fare Numbers
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    res.result!.data![index]!
                                                        .baseFare
                                                        .toString(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    res.result!.data![index]!
                                                        .minKm
                                                        .toString(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //Base Fare const Strings
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Base fare',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    'Minimum KM',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),

                                            //Cost Per Minute

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    res.result!.data![index]!
                                                        .costPerMinute
                                                        .toString(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${res.result?.data![index]?.additionalFare}',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //Cost Per Minute const Strings
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Cost Per Minute',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    'Additional KM Fare',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //Primary
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18.0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0),
                                                    child: Text(
                                                      res.result!.data![index]!
                                                          .fareName
                                                          .toString(),
                                                      style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                          ),);}),
                    );
                  }
                },
              ),
            ):
            Visibility(
              visible: _isStarted,
                child: SizedBox(
                  height:50,
                  width:50,
                   child: CircularProgressIndicator(),)),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
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
                    'Add',
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
    );
  }

  void getDriverId()async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    driverId= pref.getString('identification_key');
    debugPrint('FARE SETTING PAGE INIT $driverId');

   setState(() {
     _isStarted=false;
   });
  }

  //Start Ride Dialog Box-------------------------------------------------------->
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to add new fare?',
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
                  Navigator.pushNamed(context, addFareScreenRoute,arguments: null);
                }),
          ],
        );
      },
    );
  }


}

