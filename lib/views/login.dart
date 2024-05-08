import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_project/views/home.dart';
import 'package:music_project/views/signup.dart';

import '../controller/shared_pref.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> loadAnimation() async {
    // Simulate a network or heavy operation delay
    await Future.delayed(Duration(seconds: 3));
    // This is where you would actually load your animation or related data.
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final PreferencesService _prefsService = PreferencesService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  late bool loginSuccess;
  late bool isPremium;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFF662D8C), Color(0xffED1E79)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
            future: loadAnimation(),
            builder: (context, snapshot) {
              // Check if the future is still loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.error != null) {
                // If we caught an error
                return Center(child: Text('Error loading animation'));
              } else {
                // The future is complete and no errors occurred, show your animation
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('B E A T S',
                          style: TextStyle(
                              color: Color(0XFFD8B5FF),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 26),
                      Lottie.asset('assets/animation.json',
                          width: 150, height: 149),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: TextFormField(
                          controller: _emailController,
                          key: ValueKey('Email'),
                          style: TextStyle(color: Color(0XFFD8B5FF)),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon:
                                Icon(Icons.email, color: Color(0XFFD8B5FF)),
                            hintStyle: TextStyle(color: Color(0XFFD8B5FF)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: _isHidden,
                            style: TextStyle(color: Color(0XFFD8B5FF)),
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0XFFD8B5FF)),
                                prefixIcon: Icon(Icons.password,
                                    color: Color(0XFFD8B5FF)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _isHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color(0XFFD8B5FF)),
                                  onPressed: _toggleVisibility,
                                ))),
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(color: Colors.white),
                            elevation: 0,
                          ),
                          onPressed: () {
                            print('error in elevated');

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePage()));
                            signInWithEmailPassword();
                          },
                          child: Text(
                            'Enter the musical world',
                            style: TextStyle(
                                color: Color(0XFFD8B5FF), fontSize: 15),
                          )),
                      SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            'No Account? ,Sign Up',
                            style: TextStyle(color: Color(0xffD8B5FF)),
                          ))
                      // Adding the circular progress indicator
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  // create user with email & password function

  Future<void> signInWithEmailPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      var message = 'An error occurred, please check your credentials!';
      if (e.message != null) {
        message = e.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }
  }
}
