// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:meter_app/pages/historyPage/widgets/history_contents.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawerWidget(),
      body: Stack(
        children: [
          //Custom AppBar
          SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: HistoryContentWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
