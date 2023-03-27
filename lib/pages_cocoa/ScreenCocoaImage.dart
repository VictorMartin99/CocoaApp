import 'dart:convert';
import 'package:cocoa_app/model/PastEvents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as client;

import 'ScreenCocoaDayImages.dart';

class ScreenCocoaImage extends StatefulWidget {
  @override
  _ScreenCocoaImageState createState() => _ScreenCocoaImageState();
}

class _ScreenCocoaImageState extends State<ScreenCocoaImage> {
  //late Future<List<File>> _listFiles;

  PastEvents? pastEvents;

  @override
  void initState() {
    super.initState();

    makePastEventsRequest();
  }

  void makePastEventsRequest() async {
    final response =
        await client.get(Uri.parse("http://localhost:8080/event/past"));

    if (response.statusCode == 200) {
      pastEvents = PastEvents.fromJson(jsonDecode(response.body));
      setState(() {});
    } else {
      pastEvents = null;
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
              icon: Icon(Icons.collections_rounded),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(156, 31, 29, 29),
        body: pastEvents == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    child: Column(children: [
                  ListView.builder(
                      itemCount: pastEvents!.events!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ScreenCocoaDayImages(
                                          event: pastEvents!.events![index])));
                            }
                            ;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              height: 140.0,
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32),
                                  ),
                                  image: DecorationImage(
                                    opacity: 150.0,
                                    image: NetworkImage(
                                        pastEvents!.events![index].flyerUrl!),
                                    fit: BoxFit.cover,
                                  )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      pastEvents!.events![index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.leagueGothic(
                                        fontSize: 20,
                                        color: Colors.white,
                                        letterSpacing: .8,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      pastEvents!.events![index].theme!,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                ]))));
  }
}
