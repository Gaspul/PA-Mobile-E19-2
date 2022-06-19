import 'package:flutter/material.dart';

class contactus extends StatelessWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Contact Us'),
        elevation: 15.0,
      ),
      body: Center(
        child: Container(
          child: Text(
            'To contact us, you can find us through this:\n\nIG : @njalokkopi\nWhatsapp : 085349632898',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class aboutapp extends StatelessWidget {
  const aboutapp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About App'),
        elevation: 15.0,
      ),
      body: Center(
        child: Container(
          child: Text(
            'This up designed for homebrewer that\ncan making their own recipe of brewing coffee\nthrough any brewing method',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class version extends StatefulWidget {
  const version({Key? key}) : super(key: key);

  @override
  State<version> createState() => _versionState();
}

class _versionState extends State<version> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Version'),
        elevation: 15.0,
      ),
      body: Center(
        child: Container(
          child: Text(
            'This app is very first version\nwe hope, we can develop this app\nto user friendly and better UI/UX',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}