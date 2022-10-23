import 'package:flutter/material.dart';

class DinamikWidget extends StatelessWidget {
  TextEditingController harfNotu = new TextEditingController();
  TextEditingController kredi = new TextEditingController();
  final int dersNumarasi;

  DinamikWidget(this.dersNumarasi);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
//      margin: new EdgeInsets.all(8.0),
        child: ListBody(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Ders ${dersNumarasi}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextField(
                    controller: harfNotu,
                    decoration: const InputDecoration(
                        labelText: 'Harf Notu', border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextField(
                    controller: kredi,
                    decoration: const InputDecoration(
                        labelText: 'Kredi', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}