// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
      child: Container(
        height: size.height * 0.085,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.directions),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'where to?',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}

//CustomSearchDelegate---------------------------------------------------------!>

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Kuniyamuthur',
    'Kovai Pudur',
    'Milekal',
    'Idayar Palayam',
    'Race Course',
    'RS Puram',
    'Peelamedu',
    'Ukkadam',
    'Podanur',
    'New York Avenue',
    'Arivoli Nagar',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in searchTerms) {
      if (place.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(place);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in searchTerms) {
      if (place.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(place);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {},
          title: Text(result),
        );
      },
    );
  }
}
