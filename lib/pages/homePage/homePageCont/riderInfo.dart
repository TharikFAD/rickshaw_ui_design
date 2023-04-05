// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/calculate_change.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/rideInfoNavContainer.dart';
import 'package:meter_app/routes/route_name.dart';

class RiderInfoPage extends StatefulWidget {
  const RiderInfoPage({super.key});

  @override
  State<RiderInfoPage> createState() => _RiderInfoPageState();
}

class _RiderInfoPageState extends State<RiderInfoPage> {
  @override
  Widget build(BuildContext context) {
    var totalController = TextEditingController();
    var balanceController = TextEditingController();

    double _myTestFareResult = 154.56;
    var _result = "₹" + _myTestFareResult.toString();
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
                                        margin: EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        height: size.height * 0.51,
                                        child: SingleChildScrollView(
                                          child: Column(children: [
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
                                                  width: size.width * 0.02,
                                                ),
                                              ],
                                            ),
                                            //Your Pop up design
                                          ]),
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
                Text(
                  _result,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 25 * 2),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MyNavBarWidget(),
    );
  }
}
