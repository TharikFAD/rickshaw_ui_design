// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/calculate_change.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/rideInfoNavContainer.dart';
import 'package:meter_app/routes/route_name.dart';

import '../../../model/trip/trip_complete_request.dart';
import '../../../routes/route_name.dart';

class RiderInfoPage extends StatefulWidget {
  const RiderInfoPage({super.key});

  @override
  State<RiderInfoPage> createState() => _RiderInfoPageState();
}

class _RiderInfoPageState extends State<RiderInfoPage> {
  @override
  Widget build(BuildContext context) {
    TripCompleteResponse? tripCompleteResponse =
        ModalRoute.of(context)?.settings.arguments as TripCompleteResponse?;
    var totalController = TextEditingController();
    var balanceController = TextEditingController();

    var result = "₹${tripCompleteResponse?.result?.fare?.totalFare!}";
    double _myTestFareResult = 154.56;
    var size = MediaQuery.of(context).size;
    //double balanceAmount = 0.0;
    void dispose() {
      super.dispose();
      totalController.dispose();
    }

    totalController.addListener(() {
      double balanceAmount = 0.0;
      double cashReceived = double.tryParse(totalController.text) ?? 0.0;
      balanceAmount = cashReceived - _myTestFareResult;
      setState(() {
        balanceController.text = balanceAmount.toString();
      }); // update the UI with the new balance amount
    });

    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text(
          "Ride Complete",
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
      //Drawer
      drawer: MyDrawerWidget(),
      //body
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        showGeneralDialog(
                          barrierLabel: "showMenuPopUp",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.7),
                          transitionDuration: const Duration(milliseconds: 200),
                          context: context,
                          pageBuilder: (dialogContext, anim1, anim2) {
                            return Material(
                              color: Colors.transparent,
                              child: StatefulBuilder(
                                builder: (BuildContext dialogContext,
                                    void Function(void Function())
                                        setDialogState) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        height: size.height * 0.51,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Text(
                                              'Calculate Change',
                                              style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),

                                            //somethin'
                                            //Total Amount
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 18.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text('Total Amount'),
                                                ],
                                              ),
                                            ),

                                            //somethin' else
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0,
                                                  right: 18.0,
                                                  top: 8.0),
                                              child: Container(
                                                height: size.height * 0.08,
                                                width: size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  //color: Colors.grey,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '₹ ${_myTestFareResult}',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0,
                                                  right: 18.0,
                                                  top: 16.0),
                                              child: CalculateChangeWidget(
                                                  controller: totalController,
                                                  hintText: "Recieved",
                                                  typeInput:
                                                      TextInputType.number),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0,
                                                  right: 18.0,
                                                  top: 16.0),
                                              child: CalculateChangeWidget(
                                                  controller: balanceController,
                                                  hintText: "Balance",
                                                  typeInput:
                                                      TextInputType.number),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    //color: Color(0xFF4885ED),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: Text(
                                                      'OK',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color(
                                                              0xFF000000)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.04,
                                                ),
                                              ],
                                            ),
                                            //Your Pop up design
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return ScaleTransition(scale: anim1, child: child);
                          },
                        );
                      },

                      //Image
                      child: SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.1,
                        child: Image.asset('assets/Calculator.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.1,
                        child: Icon(Icons.share),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.055,
                    ),
                  ],
                ),
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 25),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                //fare
                Text(
                  result,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 25 * 2),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.62,
        width: size.height,
        decoration: BoxDecoration(
          color: Color(0xFF4885ED),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        //Ride Info Data
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Start
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Fri, Dec 2, 2022 09:57:30',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //End
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'End',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Fri, Dec 2, 2022 12:00:30',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Trip Duration
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip Duration',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${tripCompleteResponse?.result?.tripDuration?.duration} s',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Divider
                Container(
                  width: size.width,
                  height: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Distance
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Distance',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${tripCompleteResponse?.result?.reading?.kmTravelled} Meters',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Waiting Time
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waiting Time',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${tripCompleteResponse?.result?.reading?.waitingTime} s',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Divider
                Container(
                  width: size.width,
                  height: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Base Fare
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Base Fare',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹${tripCompleteResponse?.result?.fare?.baseFare}',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Distance Fare
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Distance Fare',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹${tripCompleteResponse?.result?.fare?.distanceFare}',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Waiting Fare
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waiting Fare',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹${tripCompleteResponse?.result?.fare?.waitingFare} ',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Surge Pricing
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Surge Pricing',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${tripCompleteResponse?.result?.fare?.surgePrice} x',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Additional Fare
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Additional Fare',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹ ${tripCompleteResponse?.result?.fare?.additionalFare}',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //divider
                Container(
                  width: size.width,
                  height: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Home Button
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, homeScreenRoute);
                  },
                  child: Container(
                    height: size.height * 0.08,
                    width: size.height,
                    //decoration: BoxDecoration(),
                    child: Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.white,
                    ),
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
