// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/fare_api.dart';
import 'package:meter_app/model/create_fare.dart';
import 'package:meter_app/pages/fareSettingsPage/widgets/fareNameTextField.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFarePage extends StatefulWidget {
  const AddFarePage({super.key});
  @override
  State<AddFarePage> createState() => _AddFarePageState();
}

class _AddFarePageState extends State<AddFarePage> {
  var _isStarted = false;
  var _Controller = TextEditingController();
  var _fareController = TextEditingController();
  var _kilometerController = TextEditingController();
  var _baseFareController = TextEditingController();
  var _additionalFareController = TextEditingController();
  var _costPerMinuteController = TextEditingController();
  var createFareRequestBody=CreateFareRequestBody();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        //Inside This Stack Widget, Whatever written first is placed in Front (or) UP layer
        child: Stack(
          children: [
            //Add Button => Top Layer
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.9,
                  ),
                  ElevatedButton(
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
                      'Save',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Contents => Middle Layer
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 12.0, right: 12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      //Fare Name
                      Text(
                        'Fare Name',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  FareNameTextFormField(
                    controller: _Controller,
                    hintText: 'Fair Name',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //Min Kms && Base Fare
                  Row(
                    children: [
                      Text(
                        'Minimum Kilometer and base fare',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.075,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey),
                        child: FareNameTextFormField(
                          controller: _kilometerController,
                          hintText: 'Min Kms',
                          typeInput: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: size.height * 0.075,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: FareNameTextFormField(
                          controller: _baseFareController,
                          hintText: 'Base Fare',
                          typeInput: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  //Aditional Fare per KM
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Additional Fare per KM',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: FareNameTextFormField(
                        controller: _additionalFareController,
                        hintText: '₹ Additional Fare',
                        typeInput: TextInputType.number,
                      ),
                    ),
                  ),

                  //Cost Per Minute
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Cost per Minute',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: FareNameTextFormField(
                        controller: _costPerMinuteController,
                        hintText: 'Cost Per Minute',
                        typeInput: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  //Waiting Charges

                  // Row(
                  //   children: [
                  //     Text(
                  //       'Waiting Charges',
                  //       style: GoogleFonts.inter(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w700,
                  //           color: Colors.black),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.01,
                  // ),
                  // Container(
                  //   height: size.height * 0.08,
                  //   width: size.width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Center(
                  //     child: FairNameTextFormField(
                  //       controller: _additionalFareController,
                  //       hintText: 'Waiting Charges per Hour',
                  //       typeInput: TextInputType.number,
                  //     ),
                  //   ),
                  // ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.5,
                  ),

                  Divider(),
                ],
              ),
            ),

            //App Bar => Last Layer
            CustomAppBar(),
          ],
        ),
      ),
    );
  }

  //Start Ride Dialog Box-------------------------------------------------------->
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to save this fare?',
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
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  var id=pref.getString('identification_key');
                  var fareName=_Controller.text.trim();
                  var minKm=_kilometerController.text.trim();
                  var baseFare=_baseFareController.text.trim();
                  var additionalFare=_additionalFareController.text.trim();
                  var costPerMin=_costPerMinuteController.text.trim();

                  createFareRequestBody.identificationKey=id;
                  createFareRequestBody.fareInfo?.fareName=fareName;
                  createFareRequestBody.fareInfo?.minKm=double.parse(minKm);
                  createFareRequestBody.fareInfo?.baseFare=int.parse(baseFare);
                  createFareRequestBody.fareInfo?.additionalFare=int.parse(additionalFare);
                  createFareRequestBody.fareInfo?.costPerMinute=double.parse(costPerMin);
                  debugPrint('ADD FARE PAGE $createFareRequestBody');

                  FareAPI().createFare(createFareRequestBody).then((value) async{
                    if(value.statuscode==200){

                    }else{

                    }

                  });

                  Navigator.popAndPushNamed(context, fareSettingScreenRoute);
                }),
          ],
        );
      },
    );
  }
}
