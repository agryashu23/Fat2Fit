import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 import 'package:gym/provider.dart';
import 'package:gym/table.dart';
import 'package:gym/yess.dart';
import 'package:provider/provider.dart';

import 'Current.dart';
import 'Diet.dart';
import 'Homepage.dart';
import 'Log.dart';
import 'Pages/Plans.dart';
import 'Plans.dart';
import 'Splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (context) => FormModel(),
        child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}



