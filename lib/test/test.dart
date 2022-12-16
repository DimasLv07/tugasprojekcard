import 'package:flutter/src/widgets/container.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasprojekcard/utils.dart';
import 'model.dart';

Map mapResponse = {};
Map dataResponse = {};
List listResponse = {} as List;

class apipro extends StatefulWidget {
  const apipro({Key? key}) : super(key: key);

  @override
  State<apipro> createState() => _apipro();
}

class _apipro extends State<apipro> {
  var apikey = '80e2a800850d4c05be339ccf1652964c';
  Future<List> team() async {
    var now = new DateTime.now();
    var yesterday = DateTime.now().subtract(Duration(days: 1));

    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDateNow = formatter.format(now);
    String formattedDateYesterday = formatter.format(yesterday);
    http.Response response;
    response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=a&from=$formattedDateYesterday&to=$formattedDateNow&apiKey=${apikey}"));
    // ignore: unnecessary_null_comparison

    Map mapResponse = json.decode(response.body);
    return mapResponse['articles'] as List;
  }

  @override
  void initState() {
    // team();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5.0),
      child: FutureBuilder<List?>(
          future: team(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text(
                  'Loading....',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List data = snapshot.data ?? [];

                  return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return Stack(
                            children: <Widget>[
                              Image.network(data[index]['urlToImage'], fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    'No. ${imgList.indexOf(data[index]['urlToImage'])} image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(autoPlay: true, enlargeCenterPage: true, aspectRatio: 2.6),
                        itemCount: 5,
                      ));
                }
            }
          }),
    );
  }
}
