import 'package:flutter/material.dart';

class ItemCardSee extends StatelessWidget {
  final String namaresep;
  final int coffeamount;
  final int wateramount;
  final int heat;
  final String proses;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCardSee(this.namaresep, this.coffeamount, this.wateramount, this.heat,
      this.proses,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 255, 85, 0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    namaresep,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "Coffe    : $coffeamount g",
                ),
                Text(
                  "Water    : $wateramount ml",
                ),
                Text(
                  "Heat     : $heat Celcius",
                ),
                Text(
                  "Process  : $proses",
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Color.fromARGB(255, 255, 0, 157),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      //if (onDelete != null) onDelete!();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
