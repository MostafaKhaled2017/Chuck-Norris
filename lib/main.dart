// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/Home.dart';

void main() {
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
