import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(new MaterialApp(home: new application()));
}

class application extends StatefulWidget {
  const application({super.key});

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
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
                          color: Colors.white
                        ),
                        child: const Icon(Icons.account_circle,size: 20),
                      ),
                      Container(
                        
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
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
                                fontSize: 11
                              ),
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
                        children:  [
                          const Text("846", style:
                            TextStyle(
                              fontWeight: FontWeight.w400, 
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text("Collect",
                            style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                            color: Colors.white70,
                            fontSize: 10,
                            ), 
                          )
                        ],
                      ),
                      Column(
                        children:  [
                          const Text("51", style:
                            TextStyle(
                              fontWeight: FontWeight.w400, 
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text("Attention",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                            color: Colors.white70,
                            fontSize: 10,
                            ), 
                          )
                        ],
                      ),
                      Column(
                        children:  [
                          const Text("267", style:
                            TextStyle(
                              fontWeight: FontWeight.w400, 
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text("Track",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                            color: Colors.white70,
                            fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children:  [
                          const Text("39", style:
                            TextStyle(
                              fontWeight: FontWeight.w400, 
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text("Coupons",style: GoogleFonts.poppins(
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
            )
            
          ],
        ),
      ),
    );
  }
}
