import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _scrollController = ScrollController();
  Query dbFetch = FirebaseDatabase.instance.ref().child("users");
  late DatabaseReference dbRef;

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(_controllerName.text);

      dbRef.push().set({
        'email': _controllerEmail.text,
        'password': _controllerPassword.text
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('News API Dimas');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  Widget listItem({required Map users}) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(users['name']),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogin ? 'Login ' : "Register ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            if(!isLogin) _entryField('Name', _controllerName),
            SizedBox(
              height: 30,
            ),
            _entryField('email', _controllerEmail),
            SizedBox(
              height: 30,
            ),
            _entryField('password', _controllerPassword),
            SizedBox(
              height: 30,
            ),
            _errorMessage(),
            _submitButton(),
            SizedBox(
              height: 20,
            ),
            _loginOrRegisterButton(),
            Text("Akun Yang sudah di Registerasi",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 14)),
            Expanded(
              child: Container(
                  height: 100,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: FirebaseAnimatedList(
                      controller: _scrollController,
                        query: FirebaseDatabase.instance.ref('users'),
                        padding: new EdgeInsets.all(8.0),
                        reverse: false,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          // ignore: unnecessary_new
                          return new ListTile(
                            title:
                                Text(snapshot.child('email').value.toString()),
                            subtitle: Text(
                                snapshot.child('password').value.toString()),
                          );
                        }),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Made by: Dimas Fenndriansyah"),
          ],
        ),
      ),
    );
  }
}

class DetailP extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final String uid;
  DetailP(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(uid)),
      body: Center(
        child: Text(uid),
      ),
    );
  }
}
