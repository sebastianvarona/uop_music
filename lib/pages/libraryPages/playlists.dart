import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uop_music/json/song_json.dart';

import '../../constants.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Wrap(
            children: List.generate(playlists.length, (index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: MediaQuery.of(context).size.width / 2 - 20,
                  child: Icon(
                    Icons.playlist_play,
                    size: 100,
                  ),
                  decoration: BoxDecoration(
                      color: accentc, borderRadius: BorderRadius.circular(10)),
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
          );
        })));
  }
}
