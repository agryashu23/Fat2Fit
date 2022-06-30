import 'package:flutter/material.dart';
import 'package:gym/Actions/Setttings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../Icons.dart';
import '../NavigationDrawer.dart';
import '../yess.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {

                },
                child: Icon(
                  Icons.search,
                  size: 28.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(
                offset: Offset(0,AppBar().preferredSize.height*0.8),
                onSelected: (item) => onSelected(context,item),
                itemBuilder: (BuildContext context) =>[
                  PopupMenuItem(
                    value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.settings,color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child:  Text("Settings"),
                          )
                        ],)),
                  PopupMenuItem(
                    value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.star,color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child:  Text("Ratings"),
                          )
                        ],))
                ],
                child: Icon(
                  Icons.more_vert,
                  size: 28.0,
                ),
              )
          ),
        ],
        leading: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: Icon(Custom.menu),

              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabApp(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Stack(
          children: <Widget>[
            new Icon(
              Icons.notifications,
              size: 25.5,
            ),
            Positioned(
              right: -1.0,
              top: -1.0,
              child: Stack(
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    size: 12.0,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          setState(() {
          });
        },
      ),

    );
  }
  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      starColor: Colors.amber,
      title: Text('Rate Us',textAlign:TextAlign.center),
      image: Image.asset("assets/loho-remove.png",
        height: 100,),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }

  void onSelected(BuildContext context, Object? item) {
    switch(item){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
        break;
      case 1:
        _showRatingAppDialog();
        break;

    }
  }

}
