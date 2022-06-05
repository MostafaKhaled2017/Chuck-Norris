import 'package:flutter/material.dart';
import 'package:project2/Presenter/presenter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements View {
  late JokesPresenter presenter;

  late String jokeValue = 'Joke';
  late String jokeUrl = 'Url';
  late String photoUrl = 'Url';

  @override
  void initState() {
    super.initState();

    // Initializing an instance of the constructor
    presenter = JokesPresenter(context, this);

    //Getting the first joke from the API
    presenter.showJoke();
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(7.8, 7.8, 7.8, 70.0),
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
                onPressed: presenter.showJoke,
                style: ElevatedButton.styleFrom(minimumSize: const Size(200.0, 38.0)),
                child: const Text('Like'),
              ),
              ElevatedButton(
                onPressed: presenter.openInBrowser,
                style: ElevatedButton.styleFrom(minimumSize: const Size(200.0, 38.0)),
                child: const Text('Open in Browser'),
              ),
              ElevatedButton(
                onPressed: presenter.showPhotos,
                style: ElevatedButton.styleFrom(fixedSize: const Size(200.0, 38.0)),
                child: const Text('Show Relevant Photos'),
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

  @override
  void openUrl(String type) {
    //To show relevant photos to the joke
    if (type == 'View Photos') {
      String jokeContent = jokeValue.replaceAll(' ', '+');
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
        jokeUrl,
        forceSafariVC: false,
      );
    }
  }
}
