import 'package:cocoa_app/model/ImagesByEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';

class ScreenCocoaImageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final img = ModalRoute.of(context)!.settings.arguments as MyImage;

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //Espacio paredes iphone 10 good
            margin: const EdgeInsets.only(top: 120),
            child: Column(children: <Widget>[
              Hero(
                tag: img.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.transparent,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage("assets/gifs/loading.gif"),
                      image: NetworkImage(
                          "http://localhost:8080/dbimages/${img.id}.png"),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.save,
                    color: Colors.green,
                    size: 25.0,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 250,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  try {
                    // Saved with this method.
                    var imageId = await ImageDownloader.downloadImage(
                        "http://localhost:8080/dbimages/${img.id}.png");

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("DESCARGA COMPLETADA CON EXITO")));

                    if (imageId == null) {
                      return;
                    }
                    //print(idImage);

                    // Below is a method of obtaining saved image information.

                  } on PlatformException catch (error) {
                    print(error);
                  }
                },
                icon: const Icon(Icons.download),
                label: const Text('            Download Image            '),
                backgroundColor: Colors.pink,
              ),
            ]),
          ),
        ));
  }
}
