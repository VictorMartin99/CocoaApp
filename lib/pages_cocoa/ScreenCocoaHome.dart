import 'package:flutter/material.dart';

import '../Widgets/home_widgets.dart';


class ScreenCocoaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, "HomeScreen");
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/LogoCocoa.png',
          width: 200,
          height: 110,
        ),
      ),
      backgroundColor: Color.fromARGB(156, 31, 29, 29),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            //child:
          ),
          const SizedBox(
            height: 10,
          ),
          //Tarjetas
          ThisWeekPartys(),
          SliderNextPartys(),
          Aftermovies()
        ]),
      ),
    );
  }
}
