import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificationApi{
  static final flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();



   Future initialize() async{
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String payload) async {
    //       onNotificationClick(payload);    // your call back to the UI
    //     });
  }

  static void showNotifications({
    int id =0,
    required String title,
    required String body,
    String? payload,
    required DateTime scheduledDate,
}) async {
    var time = Time(20, 30, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 5',
      'CHANNEL_NAME 5',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
    NotificationDetails(android: androidChannelSpecifics, iOS: iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      0,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body', //null
      Day.sunday,
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

}