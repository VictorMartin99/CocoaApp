import 'package:cocoa_app/model/ImagesByEvent.dart';
import 'package:cocoa_app/model/PastEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

import 'package:transparent_image/transparent_image.dart';

class ScreenCocoaDayImages extends StatefulWidget {
  final Event event;

  const ScreenCocoaDayImages({super.key, required this.event});

  @override
  State<ScreenCocoaDayImages> createState() => _ScreenCocoaDayImagesState();
}

class _ScreenCocoaDayImagesState extends State<ScreenCocoaDayImages> {
  ImagesByEvent? imagesByEvent;
  int rows = 2;

  @override
  void initState() {
    super.initState();

    makeGetImagesByEventRequest();
  }

  void makeGetImagesByEventRequest() async {
    final response = await client
        .get(Uri.parse("http://localhost:8080/images/${widget.event.id}"));

    if (response.statusCode == 200) {
      imagesByEvent = ImagesByEvent.fromJson(jsonDecode(response.body));
      setState(() {});
    } else {
      imagesByEvent = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.collections_rounded),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(156, 31, 29, 29),
      body: imagesByEvent == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [_text(context), _iconOnePhoto(context)],
                    )),
                _galleryImages(context)
              ],
            ),
    );
  }

  Widget _text(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
          //color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.10,
          width: 330,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.event.name!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.leagueGothic(
                fontSize: 18,
                color: Colors.white,
                letterSpacing: .8,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              widget.event.theme!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.leagueGothic(
                fontSize: 40,
                color: Colors.white,
                letterSpacing: .8,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ])),
    );
  }

  Widget _galleryImages(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        child: MasonryGridView.builder(
          shrinkWrap: true,
          gridDelegate:
              //Cambio el numero de filas
              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rows),
          itemCount: imagesByEvent!.images!.length,
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "cocoaImageDetail",
                      arguments: imagesByEvent!.images![index]);
                },
                child: Hero(
                    tag: imagesByEvent!.images![index].id!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/gifs/loading.gif',
                              image: imagesByEvent!.images![index].url!,
                              fit: BoxFit.cover,
                              height: rows == 1 ? 250.0: 150.0)),
                    )));
          },
        ),
      ),
    );
  }

  Widget _iconOnePhoto(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.dashboard_rounded),
      color: Colors.white,
      onPressed: () {
        if (rows == 2) {
          rows = 1;
        } else {
          rows = 2;
        }

        setState(() {});
      },
    );
  }
}
