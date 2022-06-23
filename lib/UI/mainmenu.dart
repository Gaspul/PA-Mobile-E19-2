import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projekakhir_mobile_e19_2/UI/navdraw.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/aeropress.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/chemex.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/mokapot.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/frenchpress.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/kalita.dart';
import 'package:projekakhir_mobile_e19_2/mainmenucontent/v60.dart';

class mainmenu extends StatefulWidget {
  const mainmenu({Key? key}) : super(key: key);

  @override
  State<mainmenu> createState() => _mainmenuState();
}

class _mainmenuState extends State<mainmenu> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {

    GoogleSignInAccount? user = _googleSignIn.currentUser;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 170);
    final double itemWidth = size.width;

    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Brew Recipe by Njalok Kopi'),
        elevation: 15.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: size.height * .35,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "WELCOME BREWER",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/barista.png'),
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * .45,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: (itemWidth / itemHeight),
              padding: EdgeInsets.all(9),
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => aeropress())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "AEROPRESS",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/aeropress.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => frenchpress())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "FRENCH PRESS",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/french-press.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => kalita())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "KALITA WAVE",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/dripper.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => mokapot())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "MOKA POT",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/coffee-pot.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => v60())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "V60",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/coffee-filter.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => chemex())
                    ),
                  child: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    child: Text(
                      "CHEMEX",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/menuicon/chemex.png"),
                        alignment: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ]
            ),
          ),
          Row(
            children: [
              // ElevatedButton(
              //   child: Text(
              //     'Sign Out',
              //     style: TextStyle(
              //       color: Colors.white
              //     ),
              //   ),
              //   onPressed: () async {
              //     await _googleSignIn.signOut();

              //   }
              // ),
              SizedBox(width: 300,),
              IconButton(
                icon: Icon(Icons.question_mark),
                color: Colors.white,
                onPressed: () {
                  showAlert(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color.fromARGB(255, 42, 42, 42),
              //backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(10),
              content: Stack(
                clipBehavior: Clip.none, alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: Text(
                        "HAPPY BREWING\n\n Regards, \n Angga Syfa Kurniawan\n Niken Prasna Elvares \n Nur Hasannah \n Gayatri Ayu Prameswari",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center
                      ),
                  ),
                  Positioned(
                    top: -100,
                    child: Image.network("https://i.imgur.com/2yaf2wb.png", width: 150, height: 150)
                  )
                ],
              ),
                // content: Container(
                //   child: Column(
                //     children: [
                //       Container(
                //         width: 100,
                //         height: 100,
                //         decoration: const BoxDecoration(
                //           image: DecorationImage(
                //             image: AssetImage('assets/polos.png'))
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
        )
    );
  }
}