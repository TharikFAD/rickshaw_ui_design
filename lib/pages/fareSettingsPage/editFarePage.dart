// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last, unused_field, prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/fare_api.dart';
import 'package:meter_app/model/fare/create_fare.dart';
import 'package:meter_app/model/fare/get_fare_response.dart';
import 'package:meter_app/model/fare/update_fare_request.dart';
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
  var fareAPI=FareAPI();

  var fareId;
  String? fareName;
  double? kiloMeter;
  int? baseFare;
  int? additionalFare;
  double? costPerMinute;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    fareId=ModalRoute.of(context)!.settings.arguments;
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

            FutureBuilder(
              future: fareAPI.getFareByFareId(fareId),
                builder:(context,snapshot){
              if(!snapshot.hasData && snapshot.connectionState==ConnectionState.waiting){
                return SizedBox(width: 50,height: 50,child: CircularProgressIndicator());
              }else{
                var res=GetFareResponse.fromJson(snapshot.data);
               return Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12.0, right: 12.0),
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
                        initialValue: res.result?.data![0]?.fareName,
                        keyboardType: TextInputType.text,
                        onChanged: (value){
                          setState(() {
                            fareName=value;
                          });

                          print('fareName $value');
                        },
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
                             initialValue: res.result?.data![0]?.minKm?.toStringAsFixed(2),
                              onChanged: (value){
                                setState(() {
                                  kiloMeter=double.parse(value);
                                });
                                print('kiloMeter $value');
                              },
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
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                             initialValue: res.result?.data![0]?.baseFare.toString(),
                              onChanged: (value){
                                setState(() {
                                  baseFare=int.parse(value);
                                });
                              },
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
                            initialValue: res.result?.data![0]?.additionalFare.toString(),
                            onChanged: (value){
                              setState(() {
                                additionalFare=int.parse(value);
                              });
                              print('additionalFare $value');
                            },
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
                            initialValue: res.result?.data![0]?.costPerMinute?.toStringAsFixed(2),
                            onChanged: (value){
                              setState(() {
                                costPerMinute=double.parse(value);
                              });

                              print('costPerMinute $value');
                            },
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

                      Divider(),
                    ],
                  ),
                );
              }
            }),

            //Contents => Middle Layer


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


    UpdateFareRequestBody updateFareRequestBody=UpdateFareRequestBody(
        identificationKey: id,
        fareId:fareId,
    fareInfo: UpdateFareRequestBodyFareInfo(
      fareName: fareName,
      minKm: kiloMeter,
      baseFare: baseFare,
      additionalFare: additionalFare,
      costPerMinute: costPerMinute,
      currencyId: 1,
      fractionDigit: 2,
      measureUnit: 'KM',
      costPerUnit: 18,
    ));


    debugPrint('UPDATE FARE PAGE ${updateFareRequestBody.toJson()}');

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




  }




