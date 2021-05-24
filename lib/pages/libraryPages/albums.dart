import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uop_music/json/song_json.dart';

import '../../constants.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Wrap(
            children: List.generate(songs.length, (index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(songs[index]['img'])),
                      color: accentc,
                      borderRadius: BorderRadius.circular(10)),
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
            ),
          );
        })));
  }
}
