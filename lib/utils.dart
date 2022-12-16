import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import 'package:http/http.dart' as http;
import 'package:tugasprojekcard/test/test.dart';

//Declaration Colors
final colorWallet = Color.fromARGB(247, 245, 249, 249);
final colorBackground = Color.fromARGB(249, 249, 249, 249);
final Color colorPurple = HexColor.fromHex('#966AF5');
final Color colorPink = HexColor.fromHex('#FF4EB7');
final Color colorYellow = HexColor.fromHex('#FFCA3D');
final Color colorCyan = HexColor.fromHex('#23D4D6');

Map mapResponse = {};
Map dataResponse = {};
List listResponse = {} as List;

//Class Responsive
class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
// If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop!;
    }
// If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
// Or less then that we called it mobile
    else {
      return mobile!;
    }
  }
}

//Implement HEX Colors

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

//Carousel

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/indicator': (ctx) => CarouselWithIndicatorDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  String loadingImg =
      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg";
  int pageIndex = 0;
  List _get = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  var apikey = '80e2a800850d4c05be339ccf1652964c';
  List<String> img = [];
  Future _getData() async {
    var now = new DateTime.now();
    var yesterday = DateTime.now().subtract(Duration(days: 1));

    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDateNow = formatter.format(now);
    String formattedDateYesterday = formatter.format(yesterday);
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=a&from=$formattedDateYesterday&to=$formattedDateNow&apiKey=${apikey}"));

      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          _get = data['articles'];
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  @override
  void initState() {
    // team();
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5.0),
      child: CarouselSlider.builder(
        itemCount: _get.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 300,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          reverse: false,
          aspectRatio: 5.0,
        ),
        itemBuilder: (context, i, id) {
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white,
                  )),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  (() {
                    if (_get.isEmpty) {
                      return loadingImg;
                    } else {
                      return _get[i]['urlToImage'];
                    }
                  }()),
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              var url = _get[i]['urlToImage'];
              print(url.toString());
            },
          );
        },
      ),
    ));
  }
}

class ImageJson {
  final String urlToImagge;
  ImageJson({required this.urlToImagge});

  factory ImageJson.fromJson(Map<String, dynamic> json) {
    return ImageJson(
      urlToImagge: json['urlToImagge'],
    );
  }
}
