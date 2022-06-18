import 'package:flutter/material.dart';
import 'package:project2/AdditionalFiles/favorite_jokes.dart';
import 'package:project2/Widgets/joke_item.dart';

import '../Model/Joke.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Jokes'),
        ),
        body: favoriteJokes.length == 0
            ? Center(
                child: Text('Favorites List is empty'),
              )
            : ListView.builder(
                //TODO: Move the builder method to another class?
                itemBuilder: (BuildContext context, int index) {
                  Joke currentItem = favoriteJokes[index];

                  return JokeItem(currentItem.value!);
                },
                itemCount: favoriteJokes.length,
              ));
  }
}
