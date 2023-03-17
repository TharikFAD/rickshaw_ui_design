// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawer
      drawer: MyDrawerWidget(),

      body: Stack(
        children: [
          //Appbar
          Column(
            children: [
              CustomAppBar(),
            ],
          ),
        ],
      ),
    );
  }
}
