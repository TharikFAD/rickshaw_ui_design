// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/api/complaints_api.dart';
import 'package:meter_app/model/create_complaint.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/complaintTextField.dart';


class AddComplaintPage extends StatefulWidget {
  const AddComplaintPage({super.key});

  @override
  State<AddComplaintPage> createState() => _AddComplaintPageState();
}

class _AddComplaintPageState extends State<AddComplaintPage> {
   List<String> list = <String>[
    'Tamil',
    'English',
  ];
   List<String> list1 = <String>[
     'Km Low',
     'Fare Low',
     'Waiting Low',
     'Km High',
     'Fare High',
     'Waiting High',
     'Others',
   ];
   String? dropdownValue ;
   String? dropdownValue1 ;
   var _complaintsTextController = TextEditingController();
   var createComplaint=CreateComplaintRequestBody();



   @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var tripId=ModalRoute.of(context)?.settings.arguments;
    if(tripId!=null){
       createComplaint.tripId=int.parse(tripId.toString());
     // createComplaint.tripId=1;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Content
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 120),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.045,
                  ),

                  //Complaint
                  Center(
                    child: Text(
                      'Complaint',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  //Language Drop Down
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select Language',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: DropdownButton<String>(
                        hint:Text('Select Language'),
                        value: dropdownValue,
                        isExpanded: true,
                        elevation: 16,
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 102, 102, 102)),
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
                    height: size.height * 0.025,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select the issue',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Issue'),
                        isExpanded: true,
                        value: dropdownValue1,
                        elevation: 16,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
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
                        items: list1.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, textAlign: TextAlign.center),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    children: [
                      Text(
                        'Enter your complains',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  ComplaintsTextField(
                      controller: _complaintsTextController,
                      hintText: 'Your Complains here'),

                  SizedBox(
                    height: size.height * 0.2,
                  )
                ],
              ),
            ),

            //AppBar
            Column(
              children: [
                CustomAppBar(),
              ],
            ),

            //Submit Button
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.9,
                  ),

                  //BUtton thingy New Start
                  ElevatedButton(
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
                      'SUBMIT',
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
            'Do you want add a complain?',
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
              onPressed: () async{
                SharedPreferences pref=await SharedPreferences.getInstance();
                var id=pref.getString('identification_key');
                 createComplaint.identificationKey=id;
                 createComplaint.subject=dropdownValue1;
                 createComplaint.complaints=_complaintsTextController.text.trim();
                 ComplaintAPI().createComplaints(createComplaint).then((value) {
                   var res=CreateComplaintResponse.fromJson(value);
                   Fluttertoast.showToast(msg: '${res.result?.message}');
                 });
                Navigator.popAndPushNamed(context, historyScreenRoute);
              },
            ),
          ],
        );
      },
    );
  }


}
