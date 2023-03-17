import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FareList extends StatelessWidget {
  const FareList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: size.height * 0.23,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF4885ED),
        ),
        child: Center(
          child: Column(
            children: [
              //Default
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Default',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              //Base Fare Numbers
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ 40.00',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '1.8',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),

              //Base Fare const Strings
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Base fare',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Minimum KM',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              //Cost Per Minute

              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ 0.15',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '18.00',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),

              //Cost Per Minute const Strings
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cost Per Minute',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Additional KM Fare',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),

              //Primary
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Primary',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
