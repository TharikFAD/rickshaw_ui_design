import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/fareSettingsPage/widgets/fareNameTextField.dart';
import 'package:meter_app/routes/route_name.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  //Drop Down List
  List<String> list = <String>[
    '₹',
    '\$',
    '€',
    '¥',
    '₩',
    '£',
  ];

  //Drop Down rizz
  List<String> rizz = <String>[
    "Miles",
    "Kilometers",
    "Meters",
    "Yards",
    "Foot",
  ];

  //Variables
  String? dropdownValue;
  String? dropdownValue1;
  var nameController = TextEditingController();
  var fareController = TextEditingController();
  var minController = TextEditingController();
  var baseFareController = TextEditingController();
  var fractionController = TextEditingController();
  var additionalFareController = TextEditingController();
  var costPerMinuteController = TextEditingController();
  var additionalFare2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      //AppBar
      appBar: AppBar(
        title: Text(
          "CREATE COMMUNITY",
          style: GoogleFonts.bungee(fontSize: 22, fontWeight: FontWeight.w400),
        ), //appbar title
        backgroundColor: const Color(0xFF4885ED), //appbar background color

        actions: [
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, homeScreenRoute);
            },
            child: const Icon(
              Icons.home,
              size: 32,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
      ),

      //Body
      body: Stack(
        children: [
          //Contents
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                //Profile
                InkWell(
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        'assets/Profile.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: size.height * 0.02),

                //Community Field starts here------------------------------------>
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Community Name",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: FareNameTextFormField(
                      controller: nameController, hintText: ""),
                ),
                //Community Field Ends here------------------------------------!>

                //Fare Name Field starts here------------------------------------>
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Fare Name",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: FareNameTextFormField(
                      controller: fareController, hintText: ""),
                ),
                //Fare Name Field ends here------------------------------------!>

                //Currency Symbol & Fraction Digit starts here----------------------->
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Currency Symbol",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Fraction digit",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 55,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.black38)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 18.0, right: 18.0),
                          child: DropdownButton<String>(
                            hint: const Text('\$'),
                            value: dropdownValue,
                            isExpanded: true,
                            elevation: 16,
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(255, 102, 102, 102)),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, textAlign: TextAlign.center),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 55,
                          width: size.width * 0.35,
                          child: FareNameTextFormField(
                            controller: fractionController,
                            hintText: "",
                            typeInput: TextInputType.number,
                          )),
                    ],
                  ),
                ),
                //Currency Symbol & Fraction Digit ends here-----------------------!>

                //Measuring Unit starts here -------------------------------------------->
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Measuring Unit",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black38)),
                    height: 55,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                      child: DropdownButton<String>(
                        hint: const Text('eg: Km, Miles, etc..'),
                        value: dropdownValue1,
                        isExpanded: true,
                        elevation: 16,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 102, 102, 102)),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        },
                        items:
                            rizz.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, textAlign: TextAlign.center),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                //Measuring units ends here ---------------------------------------------!>

                //Minimum KM & Base Fare starts here-------------------------------->
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Minimum KM",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Base Fare",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 55,
                          width: size.width * 0.45,
                          child: FareNameTextFormField(
                            controller: minController,
                            hintText: "",
                            typeInput: TextInputType.number,
                          )),
                      SizedBox(
                          height: 55,
                          width: size.width * 0.35,
                          child: FareNameTextFormField(
                            controller: baseFareController,
                            hintText: "",
                            typeInput: TextInputType.number,
                          )),
                    ],
                  ),
                ),
                //Minimum KM & Base Fare ends here--------------------------------!>

                //Additional Fare Per KM starts here-------------------------------------------->
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Additional Fare Per KM",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: FareNameTextFormField(
                    controller: additionalFareController,
                    hintText: "",
                    typeInput: TextInputType.number,
                  ),
                ),
                //Additional Fare Per KM ends here------------------------------------------------!>

                //Cost Per Minute starts here ------------------------------------------------------>
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Cost Per minute",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: FareNameTextFormField(
                    controller: costPerMinuteController,
                    hintText: "",
                    typeInput: TextInputType.number,
                  ),
                ),
                //cost per minute ends here-----------------------------------------------------------!>

                //Additional Fare starts here-------------------------------------------------------------------->
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        "Additional fare",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: FareNameTextFormField(
                    controller: additionalFare2Controller,
                    hintText: "",
                    typeInput: TextInputType.number,
                  ),
                ),
                //Additional Fare starts here-------------------------------------------------------------------!>
                SizedBox(height: size.height * 0.3),
              ],
            ),
          ),

          //Button
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 2.0),
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
                        'Start Ride',
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
        ],
      ),
    );
  }
}

//Create Community Dialog Box-------------------------------------------------------->
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Do you want to save the community?',
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
              Navigator.pushNamed(context, kycScreenRoute);
            },
          ),
        ],
      );
    },
  );
}
