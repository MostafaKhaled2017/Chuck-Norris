import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project2/View/Home.dart';

import '../Model/Joke.dart';

class JokesPresenter {
  BuildContext context;
  late HomePageState view;
  Joke joke = Joke();

  //A constructor that takes context and the view
  JokesPresenter(this.context, this.view);

  // Get a random joke and fetch the json into a joke object
  void showJoke() {
    String url = 'https://api.chucknorris.io/jokes/random';

    //Function to fitch the Joke from the API

    void fetchJoke() async {
      try {
        var response = await Dio().get(url);
        joke = Joke.fromJson(jsonDecode(response.toString()));
        view.updateText(joke.value!, joke.url!, joke.iconUrl!);
      } catch (e) {
        //print(e);
      }
    }

    fetchJoke();

    /*  Fluttertoast.showToast(
        msg: joke.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER // Also possible "TOP" and "CENTER"
    );*/
  }

  void openInBrowser() {
    view.openUrl('View Joke');
  }

  void showPhotos() {
    view.openUrl('View Photos');
  }
}

//Abstract class with functions we will need to connect with the view
abstract class View {
  void updateText(String value, String jokeUrl, String imageUrl);

  void openUrl(String type);
}
