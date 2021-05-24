import 'dart:io';
import 'package:audiotagger/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../constants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'libraryPages/song.dart';

class SongsPage extends StatefulWidget {
  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: getSongs(),
      ),
    );
  }

  getSongs() {
    //Path ------------------------------------------
    Directory dir = Directory('/storage/emulated/0/');
    List<FileSystemEntity> _files;
    List<FileSystemEntity> _songs = [];
    _files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) _songs.add(entity);
    }
    //Page ------------------------------------------
    return Column(
      children: List.generate(_songs.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SongPlayer(
                        title: 'Song $index',
                        color: accentc,
                        songUrl: _songs[index].toString(),
                      ),
                      type: PageTransitionType.bottomToTop));
            },
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2 - 20,
                  height: MediaQuery.of(context).size.width * 0.2 - 20,
                  color: cwhite,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 - 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Song $index',
                        style: TextStyle(color: cwhite),
                      ),
                      Text(
                        'Artist $index',
                        style: TextStyle(color: cwhite),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
