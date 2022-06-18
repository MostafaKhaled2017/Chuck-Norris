// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/Home.dart';
import 'firebase_options.dart';

void main() async {
  //Initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
