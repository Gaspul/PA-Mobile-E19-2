import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/UI/landingpage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({ Key? key }) : super(key: key);

  @override
  State<splashscreen> createState() => _splashState();
}

class _splashState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/polos.png'))
              ),
            ),
          ],
        ),
      ),
    );
  }
}