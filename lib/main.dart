import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(new MaterialApp(home: new application()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  const application({super.key});

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application>
    with SingleTickerProviderStateMixin {
  static const colorWallet = Color.fromARGB(247, 245, 249, 249);
  static const colorBackground = Color.fromARGB(249, 249, 249, 249);
  final Color colorPurple = HexColor.fromHex('#966AF5');
  final Color colorPink = HexColor.fromHex('#FF4EB7');
  final Color colorYellow = HexColor.fromHex('#FFCA3D');
  final Color colorCyan = HexColor.fromHex('#23D4D6');
  late TabController _tcontrol;

  void initState() {
    _tcontrol = TabController(length: 3, vsync: this);
  }

  @override
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
                            fontSize: 24)),
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
                                          color: Colors.white),
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
                                Icons.location_city,
                                size: 18,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("data",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
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
                                Icons.location_city,
                                size: 18,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("data",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
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
                                Icons.location_city,
                                size: 18,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("data",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
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
                                Icons.location_city,
                                size: 18,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                Text("data",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
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
          Center(
            child: Text("Dimas Fendriansyah"),
          ),
          Center(
            child: Text("Logout"),
          ),
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
