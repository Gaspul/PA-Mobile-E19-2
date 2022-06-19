import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir_mobile_e19_2/item_card.dart';
import 'package:projekakhir_mobile_e19_2/item_cardsee.dart';

class frenchpress extends StatefulWidget {
  const frenchpress({Key? key}) : super(key: key);

  @override
  State<frenchpress> createState() => _frenchpressState();
}

const List<Widget> _widgetOptions = <Widget>[
  myfrenchpress(),
  Text('Coming Soon', style: TextStyle(color: Colors.amberAccent)),
  addfrenchpress(),
];

class _frenchpressState extends State<frenchpress> {
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
        title: Text('Frenchpress Recipe'),
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

class addfrenchpress extends StatefulWidget {
  const addfrenchpress({Key? key}) : super(key: key);

  @override
  State<addfrenchpress> createState() => _addfrenchpressState();
}

class _addfrenchpressState extends State<addfrenchpress> {
  final TextEditingController namaresepController = TextEditingController();
  final TextEditingController coffeamountController = TextEditingController();
  final TextEditingController wateramountController = TextEditingController();
  final TextEditingController heatController = TextEditingController();
  final TextEditingController prosesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference frenchpress = firestore.collection("frenchpress");

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              //// VIEW DATA HERE
              StreamBuilder<QuerySnapshot>(
                stream: frenchpress.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => ItemCard(
                                  e.get('Recipe Name'),
                                  e.get('Coffee Amount'),
                                  e.get('Water Amount'),
                                  e.get('Heat'),
                                  e.get('Process'),
                                  onUpdate: () {
                                    frenchpress.doc(e.id).update({
                                      'Recipe Name': namaresepController.text,
                                      'Coffee Amount': int.tryParse(
                                              coffeamountController.text) ??
                                          0,
                                      'Water Amount': int.tryParse(
                                              wateramountController.text) ??
                                          0,
                                      'Heat':
                                          int.tryParse(heatController.text) ??
                                              0,
                                      'Process': prosesController.text,
                                    });
                                    namaresepController.text = '';
                                    coffeamountController.text = '';
                                    wateramountController.text = '';
                                    heatController.text = '';
                                    prosesController.text = '';
                                  },
                                  onDelete: () {
                                    frenchpress.doc(e.id).delete();
                                  },
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
              SizedBox(height: 600)
            ],
          ),
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
                width: double.infinity,
                height: 350,
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
                                  frenchpress.add({
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

class myfrenchpress extends StatefulWidget {
  const myfrenchpress({Key? key}) : super(key: key);

  @override
  State<myfrenchpress> createState() => _myfrenchpressState();
}

class _myfrenchpressState extends State<myfrenchpress> {
  final TextEditingController namaresepController = TextEditingController();
  final TextEditingController coffeamountController = TextEditingController();
  final TextEditingController wateramountController = TextEditingController();
  final TextEditingController heatController = TextEditingController();
  final TextEditingController prosesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference frenchpress = firestore.collection("frenchpress");

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              //// VIEW DATA HERE
              StreamBuilder<QuerySnapshot>(
                stream: frenchpress.snapshots(),
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
