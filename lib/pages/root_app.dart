import 'package:flutter/material.dart';
import 'package:uop_music/constants.dart';
import 'package:uop_music/icons/m_icons.dart';
import 'package:uop_music/pages/settings_page.dart';
import 'package:uop_music/pages/songs_page.dart';
import 'home_page.dart';
import 'library_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  //Permisions
  late Permission permission;
  PermissionStatus permissionStatus = PermissionStatus.denied;

  void _listenForPermission() async {
    final status = await Permission.storage.status;
    setState(() {
      permissionStatus = status;
    });
    switch (status) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;
      case PermissionStatus.limited:
        Navigator.pop(context);
        break;
      case PermissionStatus.restricted:
        Navigator.pop(context);
        break;
      case PermissionStatus.permanentlyDenied:
        Navigator.pop(context);
        break;
    }
  }

  Future<void> requestForPermission() async {
    final status = await Permission.storage.request();
    setState(() {
      permissionStatus = status;
    });
  }

  @override
  void initState() {
    _listenForPermission();
    super.initState();
  }

  int _activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cbackground,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    var activePage = {
      0: '/ HOME',
      1: '/ LIBRARY',
      2: '/ SONGS',
      3: '/ SETTINGS'
    };

    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: cbackground,
      elevation: 0,
      title: Row(
        children: [
          Text(
            'UOP',
            style: TextStyle(
              color: accentc,
              letterSpacing: 4,
              fontSize: 23,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '${activePage[_activeTab]}',
            style: TextStyle(
              color: cwhite,
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
            ),
          ),
          Expanded(child: Container()),
          Icon(
            Icons.search,
            size: 25,
          ),
        ],
      ),
    );
  }

  Widget getFooter() {
    List footerIcons = [
      MIcons.home,
      MIcons.book,
      MIcons.note,
      MIcons.settings,
    ];
    return Container(
      height: 70,
      decoration: BoxDecoration(color: cdark),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(footerIcons.length, (index) {
            return Container(
              width: MediaQuery.of(context).size.width / 4 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _activeTab == index ? cdark : cdark,
              ),
              child: IconButton(
                icon: Icon(
                  footerIcons[index],
                  size: 25,
                  color: _activeTab == index ? accentc : cwhite,
                ),
                onPressed: () {
                  setState(() {
                    _activeTab = index;
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    Map pages = {
      0: HomePage(),
      1: LibraryPage(),
      2: SongsPage(),
      3: settingsPage(),
    };
    return pages[_activeTab];
  }
}
