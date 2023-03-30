// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/complaintPage/widgets/complaintTextField.dart';
import 'package:meter_app/pages/complaintPage/widgets/languageD-Down.dart';
import 'package:meter_app/pages/complaintPage/widgets/subjectD-Down.dart';
import 'package:meter_app/pages/complaintPage/widgets/tripID-D-Down.dart';

class AddComplaint extends StatelessWidget {
  final TextEditingController complaintsTextController =
      TextEditingController();
  AddComplaint({super.key});

  @override
  Widget build(BuildContext context) {
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
                '',
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

          Row(
            children: [
              Text(
                '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
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

          Row(
            children: [
              Text(
                '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
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

          Row(
            children: [
              Text(
                '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ComplaintsTextField(
              typeInput: TextInputType.multiline,
              controller: complaintsTextController,
              hintText: 'Your Complains here'),

          SizedBox(
            height: size.height * 0.01,
          )
        ],
      ),
    );
  }
}
