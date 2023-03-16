// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/fareSettingsPage/widget/addFareWidget.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/routes/route_name.dart';

class AddFarePage extends StatefulWidget {
  const AddFarePage({super.key});

  @override
  State<AddFarePage> createState() => _AddFarePageState();
}

class _AddFarePageState extends State<AddFarePage> {
  var _isStarted = false;
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
                        Size(size.width * 0.5, size.height * 0.07),
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
                  AddFareWidget(),
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
                onPressed: () {
                  Navigator.popAndPushNamed(context, fareSettingScreenRoute);
                }),
          ],
        );
      },
    );
  }
}

// //Start Ride Dialog Box-------------------------------------------------------->
// Future<void> _dialogBuilder(BuildContext context) {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           'Do you want to save this fare?',
//           style: GoogleFonts.inter(
//               fontSize: 15,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF000000)),
//         ),
//         actions: <Widget>[
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: Text(
//               'No',
//               style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF000000)),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: Text(
//                 'Yes',
//                 style: GoogleFonts.inter(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF000000)),
//               ),
//               onPressed: () {
//                 Navigator.popAndPushNamed(context, fareSettingScreenRoute);
//               }),
//         ],
//       );
//     },
//   );
// }
