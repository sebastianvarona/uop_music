import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uop_music/json/song_json.dart';

import '../../constants.dart';

class Artists extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Wrap(
            children: List.generate(artistsList.length, (index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: MediaQuery.of(context).size.width / 2 - 20,
                  child: Icon(Icons.person, size: 90),
                  decoration: BoxDecoration(
                      color: accentc, borderRadius: BorderRadius.circular(100)),
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
            ),
          );
        })));
  }
}
