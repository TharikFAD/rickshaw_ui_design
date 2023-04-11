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
  List<String> list = <String>[
    '₹',
    '\$',
    '€',
    '¥',
    '₩',
    '£',
  ];
  String? dropdownValue;
  String? dropdownValue1;
  var nameController = TextEditingController();
  var fareController = TextEditingController();
  var minController = TextEditingController();
  var baseFareController = TextEditingController();
  var fractionController = TextEditingController();
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

      body: Column(children: [
        SizedBox(height: size.height * 0.02),
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
          child:
              FareNameTextFormField(controller: nameController, hintText: ""),
        ),

        //Fare Name
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
          child:
              FareNameTextFormField(controller: fareController, hintText: ""),
        ),

        //Currency Symbol & Fraction Digit
        Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0),
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
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 55,
                width: size.width * 0.45,
                // child: FareNameTextFormField(
                //   controller: minController,
                //   hintText: "",
                //   typeInput: TextInputType.number,
                // )
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: DropdownButton<String>(
                    hint: const Text('\$'),
                    value: dropdownValue,
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
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
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

        //Minimum KM & Base Fare
        Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0),
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
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 8.0),
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
        )
      ]),
    );
  }
}
