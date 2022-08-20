import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/style/colors.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                enableSuggestions: true,
                controller: searchController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value){},
                style: GoogleFonts.roboto(textStyle:TextStyle(height: 1.0, color: textColor)),
                decoration:  InputDecoration(
                  labelText: 'Search',
                  labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color:textColor,fontSize: 16.0)),
                  errorStyle: const TextStyle(height: 0.3),
                  prefixIcon:const Icon(Icons.search_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
