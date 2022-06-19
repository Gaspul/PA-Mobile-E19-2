import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/UI/mainmenu.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Brew Recipe by Njalok Roastery'),
          elevation: 15.0,
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
              Container(
                width: 250,
                height: 220,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/polos.png'))),
              ),
              Text(
                'Brew Recipe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => mainmenu()));
                },
                icon: Icon(Icons.coffee),
                label: Text("Get Yours Now"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 48),
                ),
              )
          ],
        )
      )
    );
  }
}
