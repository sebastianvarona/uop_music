import 'package:flutter/material.dart';
import 'package:uop_music/json/song_json.dart';
import 'package:uop_music/pages/libraryPages/song.dart';
import '../constants.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: cbackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            //Banner ----------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Welcome \nBack',
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: cwhite,
                  letterSpacing: 2,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(height: 30),

            //Random song ----------------------------------------
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 8,
                  child: FlatButton.icon(
                      height: 50,
                      color: accentc,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.shuffle,
                        size: 30,
                      ),
                      label: Text(
                        'Random song',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
            SizedBox(height: 30),

            //Playlists ----------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Your playlists',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: cwhite,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(5, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
                          child: Icon(Icons.playlist_play, size: 80),
                          decoration: BoxDecoration(
                              color: accentc,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          playlists[index]['name'],
                          style: TextStyle(
                            color: cwhite,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
            SizedBox(height: 30),
            //Almbums ----------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Recent Albums',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: cwhite,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(5, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              color: accentc,
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img'])),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      songs[index]['title'],
                      style: TextStyle(
                        color: cwhite,
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              })),
            ),
            SizedBox(height: 30),
            //Artists ----------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Recent Artists',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: cwhite,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(5, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          height: MediaQuery.of(context).size.width * 0.375,
                          child: Icon(Icons.person, size: 80),
                          decoration: BoxDecoration(
                              color: accentc,
                              borderRadius: BorderRadius.circular(90)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      artistsList[index],
                      style: TextStyle(
                        color: cwhite,
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              })),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
