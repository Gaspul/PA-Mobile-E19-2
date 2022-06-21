import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/item_card.dart';
import 'package:projekakhir_mobile_e19_2/item_cardsee.dart';

class v60 extends StatefulWidget {
  const v60({Key? key}) : super(key: key);

  @override
  State<v60> createState() => _v60State();
}

const List<Widget> _widgetOptions = <Widget>[
  myv60(),
  Text('Coming Soon', style: TextStyle(color: Colors.amberAccent)),
  addv60(),
];

class _v60State extends State<v60> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Mokapot Recipe'),
        elevation: 15.0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Recipe',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Favorites',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Recipe',
            backgroundColor: Colors.brown,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class addv60 extends StatefulWidget {
  const addv60({Key? key}) : super(key: key);

  @override
  State<addv60> createState() => _addv60State();
}

class _addv60State extends State<addv60> {
  final TextEditingController namaresepController = TextEditingController();
  final TextEditingController coffeamountController = TextEditingController();
  final TextEditingController wateramountController = TextEditingController();
  final TextEditingController heatController = TextEditingController();
  final TextEditingController prosesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference v60 = firestore.collection("v60");

    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-5, 0),
                      blurRadius: 15,
                      spreadRadius: 5)
                ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: namaresepController,
                            decoration:
                                InputDecoration(hintText: "Recipe Name"),
                          ),
                          TextField(
                            controller: coffeamountController,
                            decoration:
                                InputDecoration(hintText: "Coffee Amount"),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: wateramountController,
                            decoration:
                                InputDecoration(hintText: "Water Amount"),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: heatController,
                            decoration: InputDecoration(hintText: "Heat"),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: prosesController,
                            decoration: InputDecoration(hintText: "Process"),
                          ),
                          Container(
                            height: 70,
                            width: 130,
                            padding: const EdgeInsets.fromLTRB(18, 15, 0, 8),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Add Data',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  //// ADD DATA HERE
                                  v60.add({
                                    'Recipe Name': namaresepController.text,
                                    'Coffee Amount': int.tryParse(
                                            coffeamountController.text) ??
                                        0,
                                    'Water Amount': int.tryParse(
                                            wateramountController.text) ??
                                        0,
                                    'Heat':
                                        int.tryParse(heatController.text) ?? 0,
                                    'Process': prosesController.text,
                                  });

                                  namaresepController.text = '';
                                  coffeamountController.text = '';
                                  wateramountController.text = '';
                                  heatController.text = '';
                                  prosesController.text = '';
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class myv60 extends StatefulWidget {
  const myv60({Key? key}) : super(key: key);

  @override
  State<myv60> createState() => _myv60State();
}

class _myv60State extends State<myv60> {
  final TextEditingController namaresepController = TextEditingController();
  final TextEditingController coffeamountController = TextEditingController();
  final TextEditingController wateramountController = TextEditingController();
  final TextEditingController heatController = TextEditingController();
  final TextEditingController prosesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference v60 = firestore.collection("v60");

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              //// VIEW DATA HERE
              StreamBuilder<QuerySnapshot>(
                stream: v60.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => ItemCardSee(
                                  e.get('Recipe Name'),
                                  e.get('Coffee Amount'),
                                  e.get('Water Amount'),
                                  e.get('Heat'),
                                  e.get('Process'),
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
