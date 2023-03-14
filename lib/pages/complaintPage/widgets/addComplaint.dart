// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/complaintPage/widgets/complaintTextField.dart';
import 'package:meter_app/pages/complaintPage/widgets/languageD-Down.dart';
import 'package:meter_app/pages/complaintPage/widgets/subjectD-Down.dart';
import 'package:meter_app/pages/complaintPage/widgets/tripID-D-Down.dart';

class AddComplaint extends StatelessWidget {
  const AddComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    var _complaintsTextController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
              child: LanguageDropDownWidget(),
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
              child: SubjectDropDownWidget(),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            children: [
              Text(
                'Select the Trip ID',
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
              child: TripIdDropDownWidget(),
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
    );
  }
}
