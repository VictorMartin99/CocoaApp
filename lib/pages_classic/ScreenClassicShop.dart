import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenClassicShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "STORE",
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
}
