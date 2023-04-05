// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last, unused_field, prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/fare_api.dart';
import 'package:meter_app/model/create_fare.dart';
import 'package:meter_app/model/get_fare.dart';
import 'package:meter_app/model/update_fare.dart';
import 'package:meter_app/pages/fareSettingsPage/widgets/fareEditTextField.dart';
import 'package:meter_app/pages/fareSettingsPage/widgets/fareNameTextField.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditFarePage extends StatefulWidget {
  const EditFarePage({super.key});
  @override
  State<EditFarePage> createState() => _EditFarePage();
}

class _EditFarePage extends State<EditFarePage> {
  bool isLoading=true;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _fareController1 = TextEditingController();
  TextEditingController _kilometerController1 = TextEditingController();
  TextEditingController _baseFareController1 = TextEditingController();
  TextEditingController _additionalFareController1 = TextEditingController();
  TextEditingController _costPerMinuteController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fareId=ModalRoute.of(context)!.settings.arguments;
    if(fareId!=null){
      getFareById(fareId);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Fare Page',
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
      body: SingleChildScrollView(
        //Inside This Stack Widget, Whatever written first is placed in Front (or) UP layer
        child: Column(
          children: [
            Visibility(
              visible: isLoading,
              child: SizedBox(width: 50,height: 50,
                  child: CircularProgressIndicator()),
            ),
            //Contents => Middle Layer
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 12.0, right: 12.0),
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
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Color(0xFF4885ED),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Fare Name',
                ),
                minLines: 1,
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
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _kilometerController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Color(0xFF4885ED),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Minimum km',
                          ),
                          minLines: 1,
                        ),
                      ),
                      Container(
                        height: size.height * 0.075,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child:TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _baseFareController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Color(0xFF4885ED),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Base Fare',
                          ),
                          minLines: 1,
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _additionalFareController1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Color(0xFF4885ED),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Additional Fare',
                        ),
                        minLines: 1,
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _costPerMinuteController1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Color(0xFF4885ED),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Cost per min',
                        ),
                        minLines: 1,
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
                ],
              ),
            ),

            //Add Button => Top Layer
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.2,
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
                onPressed: () {
                  updateFareRequest();

                  Visibility(
                    visible: isLoading,
                    child:  SizedBox(height: 10,width: 10 ,child: CircularProgressIndicator()),
                  );
                  Navigator.pushReplacementNamed(context, fareSettingScreenRoute);
                }),
          ],
        );
      },
    );
  }

  void updateFareRequest() async{
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref=await SharedPreferences.getInstance();
    var id=pref.getString('identification_key');
    var fareName=_controller1.text.trim();
    var minKm=_kilometerController1.text.trim();
    var baseFare=_baseFareController1.text.trim();
    var additionalFare=_additionalFareController1.text.trim();
    var costPerMin=_costPerMinuteController1.text.trim();
    UpdateFareRequestBody updateFareRequestBody=UpdateFareRequestBody(
        driverKey: id,
        fareInfo: UpdateFareRequestBodyFareInfo(
          fareName:fareName,
          currencyId: 1,
          fractionDigit: 2,
          measureUnit: 'KM',
          baseFare:int.parse(baseFare),
          minKm: double.parse(minKm),
          costPerMinute: double.parse(costPerMin),
          additionalFare: int.parse(additionalFare),
          costPerUnit: 18,
        ));


    debugPrint('ADD FARE PAGE ${updateFareRequestBody.toJson()}');

    FareAPI().updateFare(updateFareRequestBody).then((value) async{
      if(value.statusCode==200){
        var res=CreateFareResponse.fromJson(jsonDecode(value.body));
        Fluttertoast.showToast(msg: res!.result!.Messsage!);
      }else{
        Fluttertoast.showToast(msg: 'Updating Fare Failed');
      }

    });


    setState(() {
      isLoading = false;
    });

  }

  void getFareById(fareId) async {

          debugPrint("INSIDE EDITFARE $fareId");
          FareAPI().getFareByFareId(fareId).then((value) {
            debugPrint("INSIDE EDITFARE ${value}");
            var res=GetFareResponse.fromJson(value);

            _controller1.text=res.result!.data![0]!.fareName!;
              _kilometerController1.text=res.result!.data![0]!.minKm!.toString();
              _baseFareController1.text=res.result!.data![0]!.baseFare!.toString();
              _costPerMinuteController1.text=res.result!.data![0]!.costPerMinute.toString();



          });
          setState(() {
            isLoading=false;
          });


  }

  @override
  void dispose() {
    super.dispose();

  }
}
