// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/fareSettingsPage/widgets/fareNameTextField.dart';

class AddFareWidget extends StatelessWidget {
  const AddFareWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController kilometerController = TextEditingController();
    final TextEditingController baseFareController = TextEditingController();
    final TextEditingController additionalFareController =
        TextEditingController();
    final TextEditingController costPerMinuteController =
        TextEditingController();
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            //Fare Name
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
              controller: controller,
              hintText: '',
              typeInput: TextInputType.name,
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
                  ),
                  child: FareNameTextFormField(
                    controller: kilometerController,
                    hintText: '',
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
                    controller: baseFareController,
                    hintText: '',
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
                  controller: additionalFareController,
                  hintText: '',
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
                  controller: costPerMinuteController,
                  hintText: '',
                  typeInput: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            const Divider(),
          ],
        ),
      ),
    );
  }
}
