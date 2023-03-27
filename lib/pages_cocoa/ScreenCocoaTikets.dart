// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenCocoaTikets extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "ERROR $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "TICKETS",
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
      body: Center(
        child: ElevatedButton(
            child: Text(
              "COMPRAR ENTRADAS",
            ),
            onPressed: () {
              const url = "https://www.fourvenues.com/es/cocoa-mataro";
              launch(url);
            }),
      ),
    );
  }
}
