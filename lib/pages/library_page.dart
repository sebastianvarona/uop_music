import 'package:flutter/material.dart';
import '../constants.dart';
import 'libraryPages/albums.dart';
import 'libraryPages/artists.dart';
import 'libraryPages/playlists.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _activeCat = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: cbackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            //Tabs ------------------------------------
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _activeCat = 0;
                          });
                        },
                        child: Text(
                          'Playlists',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: cwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 5,
                        color: _activeCat == 0 ? accentc : cbackground,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _activeCat = 1;
                          });
                        },
                        child: Text(
                          'Albums',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: cwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 5,
                        color: _activeCat == 1 ? accentc : cbackground,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _activeCat = 2;
                          });
                        },
                        child: Text(
                          'Artists',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: cwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 5,
                        color: _activeCat == 2 ? accentc : cbackground,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            //Content
            libContent(),
          ],
        ),
      ),
    );
  }

  Map libPages = {0: Playlists(), 1: Albums(), 2: Artists()};
  Widget libContent() {
    return libPages[_activeCat];
  }
}
