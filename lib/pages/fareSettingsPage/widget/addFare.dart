import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/fareSettingsPage/widget/fareNameTextField.dart';

class AddFare extends StatelessWidget {
  const AddFare({super.key});

  @override
  Widget build(BuildContext context) {
    var _Controller = TextEditingController();
    var _fareController = TextEditingController();
    var _kilometerController = TextEditingController();
    var _baseFareController = TextEditingController();
    var _additionalFareController = TextEditingController();
    var _costPerMinuteController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.delete_outline),
          //     ),
          //   ],
          // ),
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

          //Enter Fare
          // Row(
          //   children: [
          //     Text(
          //       'Enter Fare',
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
          //       controller: _fareController,
          //       hintText: '₹ Enter Fare',
          //       typeInput: TextInputType.number,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),

          // //Measuring Units
          // Row(
          //   children: [
          //     Text(
          //       'Measuring Unit',
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
          //   height: size.height * 0.075,
          //   width: size.width,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(18),
          //       border: Border.all(color: Colors.grey)),
          //   child: Center(
          //     child: UnitsDropDownWidget(),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.01,
          // ),
          // Divider(),

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
    );
  }
}
