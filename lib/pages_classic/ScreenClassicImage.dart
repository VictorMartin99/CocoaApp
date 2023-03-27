// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenClassicImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "GALLERY",
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueGothic(
            fontSize: 35,
            color: Colors.white,
            letterSpacing: .8,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(156, 31, 29, 29),
      //body: ,
    );
  }

//Cartas amb text abaix
  Widget _card1() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: FadeInImage(
              placeholder: AssetImage("assets/loading-teal-dots.gif"),
              image: AssetImage("assets/images/IMG1.JPG"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "WELCOME TO COCOA",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          )
        ]),
      ),
    );
  }

  Widget _card2() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: FadeInImage(
              placeholder: AssetImage("assets/pleaseWaitLoading.gif"),
              image: AssetImage("assets/images/IMG2.JPG"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "THIS IS COCOA",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          )
        ]),
      ),
    );
  }

  Widget _card3() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: FadeInImage(
              placeholder: AssetImage("assets/pleaseWaitLoading.gif"),
              image: AssetImage("assets/images/IMG3.JPG"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "THE REFERENCE COCOA",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          )
        ]),
      ),
    );
  }

//Cartas amb puntas bordeadas y esquinas.

}
