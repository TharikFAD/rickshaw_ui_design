// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/routes/route_name.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controller = TextEditingController();
    return Drawer(
      elevation: 0,
      backgroundColor: Color(0xFF4885ED),
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.125,
            child: DrawerHeader(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.menu, color: Colors.white),
                      ),
                      Text(
                        'Auto Karan',
                        style: GoogleFonts.bungee(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF4885ED),
              ),
            ),
          ),
          InkWell(
            child: CircleAvatar(
              radius: 50,
              child: Center(
                child: Image.asset(
                  'assets/Profile.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            onTap: () {},
          ),

          //space
          SizedBox(
            height: size.height * 0.01,
          ),

          //contents
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, homeScreenRoute);
            },
            leading: Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'HOME',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, historyScreenRoute);
            },
            leading: Icon(
              Icons.history,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'HISTORY',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, fareSettingScreenRoute);
            },
            leading: Icon(
              Icons.attach_money_rounded,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'FAIR SETTINGS',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, bookingScreenRoute);
            },
            leading: Image.asset('assets/bx_trip.png'),
            title: Text(
              'Bookings',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, settingScreenRoute);
            },
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'SETTINGS',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, communityScreenRoute);
            },
            leading: Icon(
              Icons.people,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'COMMUNITY',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Surge the price',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      content: TextField(
                        onChanged: (value) {},
                        controller: _controller,
                        decoration:
                            InputDecoration(hintText: 'e.g, 2x, 3x, 4x...'),
                        keyboardType: TextInputType.number,
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  });
            },
            leading: Icon(
              Icons.fireplace_sharp,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'SURGE PRICING',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.support_agent,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'SUPPORT',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),

          SizedBox(
            height: size.height * 0.025,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'v1.0.1',
                  style: GoogleFonts.mina(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Made with ❤️ AZEP METER',
                style: GoogleFonts.mina(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
