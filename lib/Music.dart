import 'package:flutter/material.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'Songs.dart';
import 'favourite.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  bool isSwitched = false;

  List itemsList = [
    {
      "title": "Uptown Funk",
      "singer": "One Republic",
      "url": "assets/boy1.jpg",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg",
      "status": false,
    },
    {
      "title": "Black Space",
      "singer": "Sia",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
      "status": false,
    },
    {
      "title": "Shake it off",
      "singer": "Coldplay",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
      "status": false,
    },
    {
      "title": "Lean On",
      "singer": "T. Schürger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
      "image":
          "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg",
      "status": false,
    },
    {
      "title": "Sugar",
      "singer": "Adele",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg",
      "status": false,
    },
    {
      "title": "Believer",
      "singer": "Ed Sheeran",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg",
      "status": false,
    },
    {
      "title": "Stressed out",
      "singer": "Mark Ronson",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
      "image":
          "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg",
      "status": false,
    },
    {
      "title": "Girls Like You",
      "singer": "Maroon 5",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
      "image":
          "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg",
      "status": false,
    },
    {
      "title": "Let her go",
      "singer": "Passenger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
      "image":
          "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg",
      "status": false,
    },
    {
      "title": "Roar",
      "singer": "Katy Perry",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
      "image":
          "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp",
      "status": false,
    },
  ];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  List newItems = [];

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Dark Mode On',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));
    } else {
      setState(() {
        isSwitched = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text('Light Mode On',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));
    }
  }
  TabController? controller;
  double currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      newItems = itemsList;
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;
      if (gym.likes.length != 0) {
        gym.likes.forEach((element) {
          newItems.forEach((active) {
            if (element["title"] == active["title"]) {
              active["status"] = true;
            }
          });
        });
      }
      return  Scaffold(
          backgroundColor: isSwitched ? Colors.grey : Color(0xFF03174C),
          appBar: AppBar(
            actions: [
              Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.blue.shade800,
                inactiveTrackColor: Colors.lightBlueAccent,
              ),
            ],
            bottom: TabBar(
              controller: controller,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Songs",
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Icon(MdiIcons.music)),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Playlist",
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Icon(MdiIcons.playlistPlay)),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF03174C),
            title: Text(
              "Music Player",
              style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                controller: controller,
                children: [
                  Container(),
                  Container(),



            ],
          ),
          ],
        )
      );
    });
  }
}
