// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/routes/route_name.dart';

class AddDriversPage extends StatefulWidget {
  const AddDriversPage({super.key});

  @override
  State<AddDriversPage> createState() => _AddDriversPageState();
}

class _AddDriversPageState extends State<AddDriversPage> {
  bool showContainer = true;

  void deleteContainer() {
    setState(() {
      showContainer = false;
    });
  }

  void addContainer() {
    setState(() {
      showContainer = true;
    });
  }

  var addDriversController = TextEditingController();
  String enteredText = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //AppBar
      appBar: AppBar(
        title: Text(
          "Add Drivers",
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

      //Body
      body: Stack(
        children: [
          //Contents
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
                style: GoogleFonts.lexend(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),

              //Number Field and button
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      "Enter Mobile Number",
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextField(
                        controller: addDriversController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Enter Mobile Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        addContainer();
                        enteredText = addDriversController.text;
                      });
                    },
                    child: const Icon(Icons.add),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(size.width * 0.1, size.height * 0.08),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                ],
              ),

              Visibility(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    height: size.height * 0.1,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            enteredText,
                            style: GoogleFonts.inter(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                              child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.share)),
                              SizedBox(width: 2),
                              IconButton(
                                  onPressed: () {
                                    deleteContainer();
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                visible: showContainer,
              ),
            ]),
          ),

          //Button
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
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
                        'Start Ride',
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
          ),
        ],
      ),
    );
  }
}

//Create Community Dialog Box-------------------------------------------------------->
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Add These Contacts?',
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000)),
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
                  color: Color(0xFF000000)),
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
