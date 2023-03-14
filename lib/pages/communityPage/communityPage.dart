// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/routes/route_name.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'Join The Community',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          //SearchBar Widget
          Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 48.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'search community',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.05,
          ),

          //Community cards => 1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, memberScreenRoute);
                },
                child: Container(
                  height: size.height * 0.12,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/SarojaAutoService.png',
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: size.width * 0.25,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * 0.12,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/StarAuto.png', fit: BoxFit.fill),
                ),
              ),
            ],
          ),

          //Community Name => 1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'Saroja Auto',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.25,
              ),
              Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'Star Auto',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: size.height * 0.01,
          ),

          //Community cards => 2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * 0.12,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/UngaAuto.png', fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: size.width * 0.25,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * 0.12,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/enga_auto.png', fit: BoxFit.fill),
                ),
              ),
            ],
          ),

          //Community Name => 2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'Unga Auto',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.25,
              ),
              Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'Enga Auto',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
