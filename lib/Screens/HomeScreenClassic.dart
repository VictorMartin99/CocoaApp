// ignore_for_file: dead_code

import 'package:cocoa_app/Screens/screens.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';


class HomeScreenClassic extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<HomeScreenClassic> {
  int pageIndex = 2;

//Creacion de todas las rutas.
  final ScreenClassicShop _classicShop = ScreenClassicShop();
  final ScreenClassicHome _classicHome = ScreenClassicHome();
  final ScreenClassicImage _classicImage = ScreenClassicImage();
  final ScreenClassicPersonal _classicPersonal = ScreenClassicPersonal();
  final ScreenClassicTikets _classicTikets = ScreenClassicTikets();

  Widget _showPage = new ScreenClassicHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _classicPersonal;
        break;
      case 1:
        return _classicShop;
        break;
      case 2:
        return _classicHome;
        break;
      case 3:
        return _classicImage;
        break;
      case 4:
        return _classicTikets;
        break;
      default:
        return new Container(
          child: new Center(
              child: new Text(
            "No Page Found",
            style: new TextStyle(fontSize: 30),
          )),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        items: [
          CurvedNavigationBarItem(
              child: Icon(Icons.perm_identity), label: 'Personal'),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_bag_outlined),
            label: 'Store',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.image_outlined),
            label: 'Image',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.local_activity_outlined),
            label: 'Tickets',
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(223, 4, 4, 4),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Color.fromARGB(223, 4, 4, 4),
        child: _showPage,
      ),
    );
  }
}
