import 'package:flutter/material.dart';

class ScreenClassicHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo_classic.png',
          width: 100,
          height: 100,
        ),
      ),
      backgroundColor: Color.fromARGB(156, 31, 29, 29),
      //body: ,
    );
  }
}
