import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/routes/route_name.dart';

class KycPage extends StatefulWidget {
  const KycPage({super.key});

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text(
          "KYC",
          style: GoogleFonts.bungee(fontSize: 22, fontWeight: FontWeight.w400),
        ), //appbar title
        backgroundColor: const Color(0xFF4885ED), //appbar background color

        actions: [
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, homeScreenRoute);
            },
            child: const Icon(
              Icons.home,
              size: 32,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
      ),

      //Drawer
      drawer: const MyDrawerWidget(),

      //Body
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(children: [
            //Logo
            Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/ic_launcher.png"))),

            SizedBox(height: size.height * 0.02),

            //Azep
            Text(
              "Azep Community",
              style: GoogleFonts.leagueSpartan(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4885ED)),
            ),

            //Join
            Text(
              'Join as partner',
              style:
                  GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
            ),

            SizedBox(height: size.height * 0.05),

            //Contents
            Padding(
              padding: const EdgeInsets.only(left: 22.0, bottom: 8.0),
              child: Row(
                children: [
                  Text("Your Trusted",
                      style: GoogleFonts.leagueSpartan(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Experience better ride with good returns",
                        style: GoogleFonts.leagueSpartan(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.02),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(200, 74, 137, 255)),
                    child: const Icon(
                      Icons.handshake_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 18),
                  RichText(
                      text: TextSpan(
                          text:
                              "Easy few step verification to be partner with us",
                          style: GoogleFonts.leagueSpartan(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(200, 74, 137, 255)),
                      child: const Icon(Icons.group, color: Colors.white)),
                  const SizedBox(width: 18),
                  Flexible(
                    child: RichText(
                        text: TextSpan(
                            text:
                                "You have access to create & manage community",
                            style: GoogleFonts.leagueSpartan(
                                color: Colors.black,
                                fontWeight: FontWeight.w700))),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(200, 74, 137, 255)),
                    child: const Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 18),
                  RichText(
                      text: TextSpan(
                          text: "You have privilege to create booking",
                          style: GoogleFonts.leagueSpartan(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(200, 74, 137, 255)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 18),
                  RichText(
                      text: TextSpan(
                          text: "No Hidden Charges",
                          style: GoogleFonts.leagueSpartan(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),

            //Divider
            const Divider(
                indent: 28,
                endIndent: 28,
                height: 2,
                thickness: 2,
                color: Color(
                  0XFFB4B4B4,
                )),

            SizedBox(height: size.height * 0.02),

            Padding(
              padding: const EdgeInsets.only(left: 22.0, bottom: 8.0),
              child: Row(
                children: [
                  Text("Please complete below steps to become admin  ",
                      style: GoogleFonts.leagueSpartan(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.grey,
                  ),
                  Text("Verify your Mobile Number",
                      style: GoogleFonts.leagueSpartan(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, verifyMobileScreenRoute);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.grey,
                  ),
                  Text(
                    "Create Community",
                    style: GoogleFonts.leagueSpartan(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, createCommunityScreenRoute);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.grey,
                  ),
                  Text("Add 5 Drivers to the Community",
                      style: GoogleFonts.leagueSpartan(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
          ]),
        ),

        //Button
        Column(
          children: [
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 2.0),
                child: ElevatedButton(
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
                    'Complete KYC',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

//Start Ride Dialog Box-------------------------------------------------------->
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Are you sure you wanna save?",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF000000)),
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
                  color: const Color(0xFF000000)),
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
              Navigator.pushNamed(context, homeScreenRoute);
            },
          ),
        ],
      );
    },
  );
}
