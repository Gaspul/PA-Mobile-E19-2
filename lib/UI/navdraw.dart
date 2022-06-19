import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/UI/sidebarmenu.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blueGrey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                image:
                  DecorationImage(image: AssetImage('assets/polos.png'))),
            ),
            SizedBox(height: 20,),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.contact_support,
              onClicked: () => selectedItem(context, 0)
            ),
            buildMenuItem(
              text: 'About App',
              icon: Icons.lightbulb_circle_rounded,
              onClicked: () => selectedItem(context, 1)
            ),
            buildMenuItem(
              text: 'Version',
              icon: Icons.timelapse,
              onClicked: () => selectedItem(context, 2)
            ),
          ],
        ),
      ),
    );
  }
    Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {

    final hoverColor= Colors.white70;
    final color= Colors.white;

    return ListTile(
      leading: Icon(icon,color: color,),
      title : Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem (BuildContext context, int index){
    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => contactus()
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => aboutapp()
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => version()
        ));
        break;
    }
  }
}
 