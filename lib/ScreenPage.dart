import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gym/Pages/HomePage.dart';
import 'package:gym/Pages/Plans.dart';
import 'package:gym/Pages/Utility.dart';
import 'package:gym/provider.dart';
import 'package:gym/table.dart';
import 'package:gym/yess.dart';
import 'package:provider/provider.dart';

import 'Icons.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  PageController? _pageController;
  int currentIndex = 0;
  final screens =[
    HomePage(),
    Plans(),
    Utility(),
    TExist(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(initialPage: currentIndex);
  }
  @override
  void dispose() {
    // _pageController!.dispose();
    super.dispose();
  }
  void onPageChanged(int page) {
    setState(() {
      this.currentIndex = page;
    });
  }
  void onTabTapped(int index) {
    if(index != currentIndex){
      if(index!=3){
        _navigationQueue.removeWhere((element) => element == index);
        _navigationQueue.addLast(index);
        setState(() {
          this.currentIndex = index;
        });
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TExist(

        )));
      }
    }
  }
  ListQueue<int> _navigationQueue = ListQueue();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      return WillPopScope(
        onWillPop: () async {
          if (_navigationQueue.isEmpty) return true;
          setState(() {
            _navigationQueue.removeLast();
            int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
            currentIndex = position;
          });
          return false;
        },
        child:Scaffold(
          resizeToAvoidBottomInset: false,


          body: IndexedStack(
            index: currentIndex,
            children:
              screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white70,
            selectedItemColor: Colors.blue.shade400,
            unselectedItemColor: Colors.black54,
            selectedFontSize: 16,
            unselectedFontSize: 14,
            currentIndex: currentIndex,
            elevation: 3,
            iconSize: 25,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                label:'Home',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Diet',
                icon: Icon(Icons.restaurant),
              ),
              BottomNavigationBarItem(
                label: 'Progress',
                icon: Icon(Custom.task_list),
              ),
              BottomNavigationBarItem(
                label: 'Music',
                icon: Icon(Icons.music_note),
              ),
            ],
          ),
        ),
      );
    });
  }
}
