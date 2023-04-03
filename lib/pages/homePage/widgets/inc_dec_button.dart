// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncDecButtonWidget extends StatefulWidget {
  const IncDecButtonWidget({super.key});

  @override
  State<IncDecButtonWidget> createState() => _IncDecButtonWidgetState();
}

class _IncDecButtonWidgetState extends State<IncDecButtonWidget> {
  double _counter = 1.0;

  //Increment Counter Method
  void _incrementCounter()async {
    setState(() {
      if (_counter < 3.0) {
        _counter += 0.5;
      }
    });
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setDouble('surgePrice', _counter);
  }

  //Decrement Counter Method
  void _decrementCounter() async{

    setState(() {
      if (_counter > 1.0) {
        _counter -= 0.5;
      }
    });
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setDouble('surgePrice', _counter);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return
        //Increment Decrement Button
        Column(
      children: [
        Center(
            child: Text(
          '${_counter} X',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
        )),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Minus Button
            InkWell(
              onTap: () {
                _decrementCounter();
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(-2.0, -2.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                ),
                child: Icon(Icons.remove),
              ),
            ),

            //Row Spacing
            SizedBox(
              width: size.width * 0.1,
            ),

            //Plus Button
            InkWell(
              onTap: () {
                _incrementCounter();
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(-2.0, -2.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                ),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
