import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  List items = [{"title":"UpTown","singer":"Henry","image": "https://img.mensxp."
      "com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows6_"
      "5ea7d4c7225c1.jpeg","url":"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",}];
  List goal = [];
  List second =[];
  bool loading = false;
  List likes = [];
  bool play =  false;
  List weight = [];
  List task = [];
  List work = [];
  List weekdays = [];
  List daywork = [];
  List weekwork = [];
  TextEditingController controller = new TextEditingController(text: "10");
  TextEditingController tController = new TextEditingController(text: "60");

  void addGoal(index, answer) {
    goal.add({index: answer});
    notifyListeners();

  }
  void colors(color){
    color = color;
    notifyListeners();

  }
  void player(){
    play = !play;
    notifyListeners();
  }
  void addLikes(title,singer,image,url){
    likes.add({"title":title,"singer":singer,"image":image,"url":url});
    notifyListeners();
  }

  void loader(load){
    loading =load;
    notifyListeners();
  }
  void addWeight(measure,current, goal) {
    weight.add({"measure": measure,"current":current,"goal":goal});
    notifyListeners();

  }
  void addTask(tasks,date,time){
    task.add({'date':date,'task':tasks,'time':time});
    notifyListeners();
  }
  void addWorkout(title,image){
    work.add({"title":title,"image":image});
    notifyListeners();
  }

  void addDays(title,subtitle){
    weekdays.add({"title":title,"subtitle":subtitle});
    notifyListeners();
  }
  void daysWork(title){
    daywork.add({"title":title,"Monday":[],"Tuesday":[],"Wednesday":[],"Thursday":[],"Friday":[],"Saturday":[],"Sunday":[]});
    notifyListeners();
  }

}