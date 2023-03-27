// ignore_for_file: unused_element

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(156, 31, 29, 29),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/GrupCocoaLogo.png',
                    width: 200,
                    height: 120,
                  ),
                ),
                _cocoa(context),
                const SizedBox(
                  height: 20,
                ),
                _classic(context),
                const SizedBox(
                  height: 20,
                ),
                _privat(context),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "LA DISCOTECA DE REFERÈNCIA",
                    style: GoogleFonts.leagueGothic(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: .8,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cocoa(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "cocoaHomePage");
        },
        child: Container(
          height: 160.0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[850]!.withOpacity(0.29),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                    spreadRadius: 10)
              ],
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/menu_cocoa.JPG'))),
          child: const Center(
            child: Text(
              '', //Añadir texto AQUI!!!
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  _classic(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "classicHomePage");
          ;
        },
        child: Container(
          height: 160.0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[850]!.withOpacity(0.29),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                    spreadRadius: 10)
              ],
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/menu_classic.JPG'))),
          child: const Center(
            child: Text(
              '', //Añadir texto AQUI!!!
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  _privat(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "privatHomePage");
        },
        child: Container(
          height: 160.0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[850]!.withOpacity(0.29),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                    spreadRadius: 10)
              ],
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/menu_privat.jpeg'))),
          child: const Center(
            child: Text(
              '', //Añadir texto AQUI!!!
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  _logo(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/GrupCocoaLogo.png',
        ),
      ],
    );
  }
}
