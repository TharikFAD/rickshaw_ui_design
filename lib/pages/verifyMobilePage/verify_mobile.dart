import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/routes/route_name.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final phoneNoController = TextEditingController();
  var phoneNo;
  var countryCode;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //AppBar
      appBar: AppBar(
        title: Text(
          "Verify Mobile",
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

      body: Column(children: [
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
          style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
        ),

        SizedBox(height: size.height * 0.05),

        //Contents
        RichText(
          text: TextSpan(
              text:
                  "India's most accurate meter fare service provider is here!",
              style: GoogleFonts.leagueSpartan(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.01),
        RichText(
          text: TextSpan(
              text: "Experience better ride with good returns",
              style: GoogleFonts.leagueSpartan(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: size.height * 0.05),

        //Enter Mobile Number
        Padding(
          padding: const EdgeInsets.only(left: 22.0, bottom: 8.0),
          child: Row(
            children: [
              Text("Enter Mobile Number",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
            ],
          ),
        ),

        //Phone field
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: IntlPhoneField(
            controller: phoneNoController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              setState(() {
                phoneNo = phone.number;
                countryCode = phone.countryCode.toString();
              });
              print(phone.number);
            },
          ),
        ),

        const Spacer(),

        //Next Button
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
                'Next',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
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
          "Is the phone number you entered correct? ",
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
              Navigator.pushNamed(context, kycScreenRoute);
            },
          ),
        ],
      );
    },
  );
}
