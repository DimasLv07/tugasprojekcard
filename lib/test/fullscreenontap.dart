import 'package:flutter/material.dart';
import 'package:tugasprojekcard/main.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image/Detail Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  var img =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png";
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = img;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            image: img,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            img,
          ),
        ),
        onTap: () {
          _sendDataToSecondScreen(context);
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String image;

  DetailScreen({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              image,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
