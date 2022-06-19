import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/View/home.dart';
import 'package:project2/View/favorites.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;


import '../AdditionalFiles/global_methods.dart';
import '../Model/Joke.dart';

class JokesPresenter {
  BuildContext context;
  late HomePageState view;
  Joke joke = Joke();
  Box box;

  //A constructor that takes context and the view
  JokesPresenter(this.context, this.view, this.box);

  // Get a random joke and fetch the json into a joke object
  void showJoke(String category, bool initialJoke) async {
    bool isOnline = await hasNetwork(context);

    String url;
    if (category == "All categories")
      url = 'https://api.chucknorris.io/jokes/random';
    else
      url = 'https://api.chucknorris.io/jokes/random?category=${category}';

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

    if (isOnline) {
      fetchJoke();
    } else {
      onNetworkMissed(context);
    }

    if(initialJoke){
      FlutterNativeSplash.remove();
    }

    /*  Fluttertoast.showToast(
        msg: joke.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER // Also possible "TOP" and "CENTER"
    );*/
  }

  void openInBrowser() async {
    bool isOnline = await hasNetwork(context);

    if (isOnline) {
      if (joke.value == null || joke.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Load a joke first by pressing Like button'),
          ),
        );
        return;
      }

      openUrl('View Joke');
    } else {
      onNetworkMissed(context);
    }
  }

  void showPhotos() async {
    bool isOnline = await hasNetwork(context);
    if (isOnline) {
      if (joke.value == null || joke.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Load a joke first by pressing Like button'),
          ),
        );
        return;
      }

      openUrl('View Photos');
    } else {
      onNetworkMissed(context);
    }
  }

  /* void goToSearchPage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchPage()));
  }*/

  void goToFavorites() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FavoritesPage(box)));
  }

  void addToFavorites() async {
    bool isOnline = await hasNetwork(context);
    if (isOnline) {
      if (joke.value == null || joke.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Load a joke first by pressing Like button'),
          ),
        );
        return;
      }

      // Adding the joke to hive
      List<dynamic> boxContent =  box.get('jokes', defaultValue: <Joke> []);
      List<Joke> jokesList = List<Joke>.from(boxContent);
      jokesList.add(joke);
      box.put('jokes', jokesList);

      //favoriteJokes.add(joke);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Added to favorites"),
      ));

      //Adding the joke to firebase
      final db = FirebaseFirestore.instance;
      db
          .collection("favorites")
          .add(joke.toJson())
          .then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'))
          .onError((error, stackTrace) => print(error));
    } else {
      onNetworkMissed(context);
    }
  }

  void openUrl(String type) {
    //To show relevant photos to the joke
    if (type == 'View Photos') {
      String jokeContent = joke.value!.replaceAll(' ', '+');
      String photosUrl =
          'https://www.google.com/search?q=$jokeContent&tbm=isch';
      url_launcher.launch(
        photosUrl,
        forceSafariVC: false,
      );
    }
    // To Open the joke in browser
    else if (type == 'View Joke') {
      url_launcher.launch(
        joke.url!,
        forceSafariVC: false,
      );
    }
  }
}

//Abstract class with functions we will need to connect with the view
abstract class View {
  void updateText(String value, String jokeUrl, String imageUrl);
}
