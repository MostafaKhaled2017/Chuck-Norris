// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/Model/Joke.dart';


import 'View/home.dart';
import 'firebase_options.dart';

Box box;

void main() async {
  //Initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Initialize hive
  await Hive.initFlutter();

  Hive.registerAdapter(JokeAdapter());

  box = await Hive.openBox('box');

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(ChuckNorrisProject());
}

class ChuckNorrisProject extends StatefulWidget {
  @override
  ChuckNorrisProjectState createState() => ChuckNorrisProjectState();
}

class ChuckNorrisProjectState extends State<ChuckNorrisProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(box),
    );
  }
}
