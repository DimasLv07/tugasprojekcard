import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Jono(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Jono extends StatelessWidget {
  const Jono({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 600,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dimas Fendriansyah",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              "Fullstack Developer",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon12(
                          label: "Contact",
                          value: "846",
                        ),
                        Icon12(
                          label: "Attentions",
                          value: "51",
                        ),
                        Icon12(
                          label: "Track",
                          value: "627",
                        ),
                        Icon12(
                          label: "Coupons",
                          value: "39",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Icon12 extends StatefulWidget {
  final String value;

  final String label;

  const Icon12({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  State<Icon12> createState() => _Icon12State();
}

class _Icon12State extends State<Icon12> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.value,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          widget.label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        )
      ],
    );
  }
}