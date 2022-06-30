import 'package:flutter/material.dart';
import 'package:gym/Pages/Plans.dart';
import 'package:gym/Pages/Progress.dart';
import 'package:gym/table.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabApp extends StatefulWidget {
  const TabApp({Key? key}) : super(key: key);

  @override
  _TabAppState createState() => _TabAppState();
}

class _TabAppState extends State<TabApp> {
  @override
  Widget build(BuildContext context) {
    var hSize = MediaQuery
        .of(context)

        .size
        .height;
    var wSize = MediaQuery
        .of(context)
        .size
        .width;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: Column(
            children: [
              // Container(
              //   width: wSize,
              //   height: hSize*0.08,
              // ),
              Card(
                elevation: 4,
                child: Container(
                  height: hSize*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: TabBar(
                      indicatorColor: Colors.lightGreen,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                  child: Icon(MdiIcons.dumbbell,color: Colors.green,)),
                              Text(
                                "GYM",
                                style: TextStyle(fontSize: 20,color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 5, 0),
                                  child: Icon(MdiIcons.home
                                      ,color: Colors.red)),
                              Text(
                                "HOME",
                                style: TextStyle(fontSize: 20,color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 5, 0),
                                  child: Icon(MdiIcons.playlistPlay,color: Colors.blue)),
                              Text(
                                "ABS",
                                style: TextStyle(fontSize: 20,color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hSize*0.75,
                child: TabBarView(
                  children: [
                    Progress(),
                    Progress(),
                    Progress(),

                  ],
                ),
              ),
            ],
          ),

        ));
  }
}
