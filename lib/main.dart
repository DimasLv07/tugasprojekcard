// @dart = 2.9;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'auth.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'home_page.dart';
import 'test/fullscreenontap.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasprojekcard/utils.dart';
import 'test/test.dart';
import 'utils.dart';
import 'test/test2.dart';

import 'widget_tree.dart';

Map mapResponse = {};
Map dataResponse = {};
List listResponse = {} as List;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAx1hGdzLIjSRB9AjaNcigiaqIAMc-T9ck",
          appId: "1:754379498291:android:ebf35c0d7d3fe69b05d446",
          messagingSenderId: "754379498291",
          projectId: "newsflutter-74e00"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Belajar',
        home: WidgetTree(),
      );
    });
  }
}

class ApplicationSatu extends StatefulWidget {
  const ApplicationSatu({super.key});

  @override
  State<ApplicationSatu> createState() => _ApplicationSatuState();
}

class _ApplicationSatuState extends State<ApplicationSatu>
    with SingleTickerProviderStateMixin {
  List _get = [];
  List _getCarousel = [];
  bool listViewNo = true;
  String seeAllOrLess =
      "See All"; //paste apikey yang didapatkan dari newsapi.org
  var apikey = '80e2a800850d4c05be339ccf1652964c';

  late TabController _tcontrol;

  Future<List> _getDataCarousel() async {
    var now = new DateTime.now();
    var yesterday = DateTime.now().subtract(Duration(days: 1));

    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDateNow = formatter.format(now);
    String formattedDateYesterday = formatter.format(yesterday);
    http.Response response;
    response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=a&from=$formattedDateYesterday&to=$formattedDateNow&sortBy=popularity&apiKey=${apikey}"));
    // ignore: unnecessary_null_comparison

    Map mapResponse = json.decode(response.body);
    return mapResponse['articles'] as List;
  }

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

  Future _getDataC() async {
    var now = new DateTime.now();
    var yesterday = DateTime.now().subtract(Duration(days: 1));

    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDateNow = formatter.format(now);
    String formattedDateYesterday = formatter.format(yesterday);
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=a&from=$formattedDateYesterday&to=$formattedDateNow&sortBy=popularity&apiKey=${apikey}"));

      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          _getCarousel = data['articles'];
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  List<String> img = [];

  String dateNow = '';
  @override
  void initState() {
    _tcontrol = TabController(length: 3, vsync: this);
    // 2016-01-25
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    _getData();
    _getDataC();
    super.initState();

    dateNow = formattedDate;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: TabBarView(
        controller: _tcontrol,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text("User Settings",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black,
                            fontSize: 28)),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        )
                      ],
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child:
                                    const Icon(Icons.account_circle, size: 20),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dimas Fendriansyah",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      "Fullstack Developer",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w200,
                                          letterSpacing: 1,
                                          color: Colors.white70,
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "846",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Collect",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "51",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Attention",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "267",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Track",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "39",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Coupons",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: colorWallet),
                              child: Icon(Icons.attach_money),
                            ),
                            Text("Wallet")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.card_giftcard),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: colorWallet),
                            ),
                            Text("Delivery")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.chat),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: colorWallet),
                            ),
                            Text("Message")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.room_service),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: colorWallet),
                            ),
                            Text("Service")
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorPurple,
                              ),
                              child: Icon(
                                Icons.room,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("Ensure your harvesting address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ))
                              ],
                            )
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorPink,
                              ),
                              child: Icon(
                                Icons.lock,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Privacy",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("System permission change",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ))
                              ],
                            )
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorYellow,
                              ),
                              child: Icon(
                                Icons.menu,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("General",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("Basic functional settings",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ))
                              ],
                            )
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorCyan,
                              ),
                              child: Icon(
                                Icons.notifications,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Notifications",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("Take over the news in time",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ))
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (listViewNo)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("News",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 28)),
                            ),
                            Text("Made by Dimas Fendriansyah")
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("Trending",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 17)),
                        ),
                        Container(
                            height: 37.h,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5.0),
                              child: CarouselSlider.builder(
                                itemCount: 5,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.white,
                                          )),
                                      //ClipRRect for image border radius
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Stack(
                                          children: [
                                            Image.network(
                                          (() {
                                            if (_getCarousel.isEmpty) {
                                              return "https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921";
                                            } else {
                                              return _getCarousel[i]
                                                  ['urlToImage'];
                                            }
                                          }()),
                                          width: 500,
                                          fit: BoxFit.cover,
                                        ),
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
                          (() {
                                            if (_getCarousel.isEmpty) {
                                              return "" ;
                                            } else {
                                              return _getCarousel[i]
                                                  ['title'];
                                            }
                                          }()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                                        )
                                          ],
                                        )
                                      ),
                                    ),
                                    onTap: () {
                                      var url = _getCarousel[i]['urlToImage'];
                                      print(url.toString());
                                    },
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Latest News",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            color: Colors.black,
                            fontSize: 17)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          seeAllOrLess = "Back";

                          if (listViewNo) {
                            listViewNo = false;
                          } else {
                            listViewNo = true;
                            seeAllOrLess = "See All";
                          }
                        });
                      },
                      child: Text(seeAllOrLess,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 20)),
                    )
                  ],
                ),
                if (_get.isEmpty)
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Center(
                          child: Text("Loading..."),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 20.h,
                      )),
                if (_get.isNotEmpty)
                  Expanded(
                    child: Container(
                        child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollStartNotification) {
                          _onStartScroll(scrollNotification.metrics);
                        }
                        return true;
                      },
                      child: ListView.builder(
                          itemCount: _get.length,
                          itemBuilder: (context, index) => Hero(
                              tag: _get[index],
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(ColorPageRoute(
                                      _get[index]['urlToImage'],
                                      _get[index]['url'],
                                      _get[index]['description'],
                                      _get[index]['publishedAt'],
                                      _get[index]['author']));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: 8,
                                          child: Container(
                                              height: 120,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 6),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 100.0,
                                                        height: 100.h,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.network(
                                                            _get[index][
                                                                    'urlToImage'] ??
                                                                "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 18,
                                                      ),
                                                      Container(
                                                        width: 58.w,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                _get[index]
                                                                        [
                                                                        "title"] ??
                                                                    "No Title",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        1,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15)),
                                                            Text(
                                                                _get[index][
                                                                        "description"] ??
                                                                    "No Description",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 3,
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    letterSpacing:
                                                                        1,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize:
                                                                        11)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                              ))),
                    )),
                  ),
              ],
            ),
          ),
          HomePage()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tcontrol,
        tabs: [
          Tab(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(Icons.home, color: Colors.black),
          ),
          Tab(
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class SecondPage extends StatelessWidget {
  var img;
  var url;
  var description;
  var publishedAt;
  var author;

  SecondPage(
      {required this.img,
      required this.url,
      required this.description,
      required this.publishedAt,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image/Detail Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Detail'),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: img,
                child: Container(
                  child: Image.network(img),
                ),
              ),
              Text(description),
              Text(
                "See Full Article",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 12),
              ),
              Text(url),
              Text("Published At $publishedAt"),
              Text('Made By $author'),
            ],
          )),
    );
  }
}

class ColorPageRoute extends MaterialPageRoute {
  ColorPageRoute(img, url, description, publishedAt, author)
      : super(
            builder: (context) => new SecondPage(
                  img: img,
                  url: url,
                  description: description,
                  publishedAt: publishedAt,
                  author: author,
                ));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

_onStartScroll(ScrollMetrics metrics) {
  print("Scroll Start");
}

_onUpdateScroll(ScrollMetrics metrics) {
  print("Scroll Update");
}

_onEndScroll(ScrollMetrics metrics) {
  print("Scroll End");
}
