import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisWeekPartys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      color: Colors.transparent,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "AQUESTA SETMANA",
            style: GoogleFonts.leagueGothic(
              fontSize: 30,
              color: Colors.white,
              letterSpacing: .8,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (_, int index) {
                return _ScrollParty();
              }),
        )
      ]),
    );
  }
}

class _ScrollParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 176,
        height: 180,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 100.0,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                  //opacity: 150.0,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/tematicas/LasVegas.jpeg'))),
          child: const Center(
              //child:
              ),
        ),
      ),
    );
  }
}

class SliderNextPartys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "PRÓXIMES FESTES",
            style: GoogleFonts.leagueGothic(
              fontSize: 30,
              color: Colors.white,
              letterSpacing: .8,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, int index) {
                return NextPartys();
              }),
        )
      ]),
    );
  }
}

class _ScrollAftermovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 176,
        height: double.infinity,
        //color: Colors.green,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
              //color: Colors.blue,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gifs/aftermovie.GIF'))),
          child: const Center(
              //child:
              ),
        ),
      ),
    );
  }
}

class Aftermovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      //color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "AFTERMOVIES",
            style: GoogleFonts.leagueGothic(
              fontSize: 30,
              color: Colors.white,
              letterSpacing: .8,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, int index) {
                return _ScrollAftermovies();
              }),
        )
      ]),
    );
  }
}

class NextPartys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 100,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/tematicas/macrofarra.jpeg'))),
        child: const Center(
            //child:
            ),
      ),
    );
  }
}
