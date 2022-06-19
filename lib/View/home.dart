import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/Presenter/home_presenter.dart';

class HomePage extends StatefulWidget {
  Box box;

  HomePage(this.box);

  @override
  HomePageState createState() => HomePageState(box);
}

class HomePageState extends State<HomePage> implements View {

  late JokesPresenter presenter;

  late String jokeValue = '';
  late String jokeUrl = '';
  late String photoUrl = '';

  late final Box box;

  final categories = [
    "All categories",
    "animal",
    "career",
    "celebrity",
    "dev",
    "explicit",
    "fashion",
    "food",
    "history",
    "money",
    "movie",
    "music",
    "political",
    "religion",
    "science",
    "sport",
    "travel"
  ];

  String? currentCategory = "All categories";

  HomePageState(this.box);

  @override
  void initState() {

    bool initialJoke = true;

    super.initState();

    // Initializing an instance of the constructor
    presenter = JokesPresenter(context, this, box);

    //Getting the first joke from the API
    presenter.showJoke(categories[0], initialJoke);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Jokes'),
      ),
      body: SizedBox(
        width: 1000,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: currentCategory,
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) =>
                            DropdownMenuItem<String>(
                                value:
                                    value, // add this property an pass the _value to it
                                child: Text(
                                  value,
                                )))
                        .toList(),
                    onChanged: (category) {
                      setState(() {
                        currentCategory = category!;
                      });
                      presenter.showJoke(category!, false);
                    },
                    isExpanded: true,
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 15, 125),
                child: Text(
                  jokeValue,
                  style: TextStyle(
                    fontSize: 18.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => presenter.showJoke(currentCategory!, false),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200.0, 38.0)),
                child: const Text('Like'),
              ),
              ElevatedButton(
                onPressed: presenter.openInBrowser,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200.0, 38.0)),
                child: const Text('Open in Browser'),
              ),
              ElevatedButton(
                onPressed: presenter.showPhotos,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200.0, 38.0)),
                child: const Text('Show Relevant Photos'),
              ),
              ElevatedButton(
                onPressed: presenter.addToFavorites,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200.0, 38.0)),
                child: const Text('Add to Favorites'),
              ),
              ElevatedButton(
                onPressed: presenter.goToFavorites,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200.0, 38.0)),
                child: const Text('Show Favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Updates the text when the joke changes
  @override
  void updateText(String value, url, imageUrl) {
    setState(() {
      jokeValue = value;
      jokeUrl = url;
      photoUrl = imageUrl;
    });
  }

}
