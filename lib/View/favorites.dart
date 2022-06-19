import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/Widgets/joke_item.dart';

import '../Model/Joke.dart';

class FavoritesPage extends StatelessWidget {

  Box box;

  FavoritesPage(this.box);

  @override
  Widget build(BuildContext context) {

    //Getting the list of favorite Jokes from hive
    List<dynamic> boxContent =  box.get('jokes', defaultValue: <Joke> []);
    List<Joke> jokesList = List<Joke>.from(boxContent);

    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Jokes'),
        ),
        body: jokesList.length == 0
            ? Center(
                child: Text('Favorites List is empty'),
              )
            : ListView.builder(
                //TODO: Move the builder method to another class?
                itemBuilder: (BuildContext context, int index) {
                  Joke currentItem = jokesList[index];

                  return JokeItem(currentItem.value!);
                },
                itemCount: jokesList.length,
              ));
  }
}
