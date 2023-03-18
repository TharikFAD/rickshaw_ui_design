// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsCard extends StatefulWidget {
  const BookingsCard({super.key});

  @override
  State<BookingsCard> createState() => _BookingsCardState();
}

class _BookingsCardState extends State<BookingsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              0.0,
              0.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              //Profile Image
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(90),
                  ),
                  child: Image.asset('assets/UngaAuto.png'),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              //Name and Phone Number
              Column(
                children: [
                  Text(
                    '~ Admin 2',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFFFF7A00),
                    ),
                  ),
                  Text(
                    '9089098907',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Audio Player
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 36,
                ),
              ),
              Slider(value: 0, onChanged: (value) {}),
              SizedBox(
                width: size.width * 0.03,
              ),
              Image.asset('assets/AudioWave.png'),
            ],
          ),

          //Accept Decline Buttons
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Accept'),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Decline'),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
