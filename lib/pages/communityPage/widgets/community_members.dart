// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';

class CommunityMemberList extends StatefulWidget {
  const CommunityMemberList({super.key});

  @override
  State<CommunityMemberList> createState() => _CommunityMemberListState();
}

class _CommunityMemberListState extends State<CommunityMemberList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'Welcome to Saroja Auto Service',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () {},
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
            Text(
              '100 Members',
              style:
                  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                width: size.width,
                child: Center(
                  child: Row(
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 2),
            SizedBox(
              height: size.height * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
