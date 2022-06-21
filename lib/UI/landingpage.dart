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
        body: Container(
            padding: EdgeInsets.all(35),
            child: ListView(
              children: [ 
              SizedBox(height: 20,),
              Container(
                width: 250,
                height: 220,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/polos.png')
                    )
                ),
              ),
              Text(
                'Hello, My Friend\nWelcome Back',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Login with your google account to continue brew your own coffee',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const mainmenu()
                    ) 
                  );
              },
              icon: Icon(Icons.coffee),
              label: Text("Brew Your Own Coffee"),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.white),
                  )
                )
              ),
            )
              // ElevatedButton.icon(
              //   onPressed: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => mainmenu()));
              //   },
              //   icon: Icon(Icons.coffee),
              //   label: Text("Brew Your Own Coffee"),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(150, 48),
              //   ),
              // )
          ],
        )
      )
    );
  }
}
