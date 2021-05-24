import 'package:flutter/material.dart';
import 'package:uop_music/constants.dart';

class SongPlayer extends StatefulWidget {
  final String title;
  final Color color;
  final String songUrl;

  const SongPlayer(
      {Key? key,
      required this.title,
      required this.color,
      required this.songUrl})
      : super(key: key);
  @override
  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cbackground,
      appBar: AppBar(
        backgroundColor: cbackground,
      ),
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    double _currenSliderValue = 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          //Portada ------------------------------------
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: accentc,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: cwhite,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 50),
          Slider(
            activeColor: accentc,
            value: _currenSliderValue,
            min: 0,
            max: 200,
            onChanged: (value) {
              setState(() {
                _currenSliderValue = value;
              });
            },
          ),
          SizedBox(height: 50),
          // Menu ------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.skip_previous,
                  color: cwhite,
                  size: 50,
                ),
              ),
              SizedBox(width: 30),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.play_circle,
                  color: cwhite,
                  size: 50,
                ),
              ),
              SizedBox(width: 30),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.skip_next,
                  color: cwhite,
                  size: 50,
                ),
              ),
              SizedBox(width: 20)
            ],
          ),
        ],
      ),
    );
  }
}
