import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/UI/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brew Recipe',
      theme: ThemeData(
        fontFamily: 'Kalam',
        primarySwatch: Colors.grey,
        dividerTheme: DividerThemeData(
          color: Colors.brown,
        ),
      ),
      home: splashscreen(),
    );
  }
}
