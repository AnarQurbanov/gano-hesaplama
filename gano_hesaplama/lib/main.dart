import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gano_hesaplama/dinamikwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GANO hesaplayıcı',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<DinamikWidget> liste = [];
  List<String> harfNotListe = [];
  List<int> krediListe = [];
  String ganoBilgi = "";
  double gano = 0;

  listeEkle() {
    if (liste.length >= 99) {
      return;
    }
    liste.add(new DinamikWidget(liste.length + 1));
    setState(() {});
  }

  veriKaydet() {
    harfNotListe = [];
    krediListe = [];
    try {
      liste.forEach((element) => harfNotListe.add(element.harfNotu.text));
      liste.forEach((element) => krediListe.add(int.parse(element.kredi.text)));

    } catch (e) {
      ganoBilgi = "Hatalı";
    }
    setState(() {});
  }

  double ganoSonucHesapla(){
    double toplam = 0;
    int toplamKredi = 0;

    for (int i=0;i<krediListe.length;i++){
      toplamKredi+=krediListe[i];
    }

    for (int i=0 ; i<krediListe.length; i++){
      if (harfNotListe[i] == "")
        return -2;
      else if (harfNotListe[i] == "aa" || harfNotListe == "AA")
        toplam += (krediListe[i]*4);
      else if (harfNotListe[i] == "ba" || harfNotListe == "BA")
        toplam += (krediListe[i]*3.5);
      else if (harfNotListe[i] == "bb" || harfNotListe == "BB")
        toplam += (krediListe[i]*3);
      else if (harfNotListe[i] == "cb" || harfNotListe == "CB")
        toplam += (krediListe[i]*2.5);
      else if (harfNotListe[i] == "cc" || harfNotListe == "CC")
        toplam += (krediListe[i]*2);
      else if (harfNotListe[i] == "dc" || harfNotListe == "DC")
        toplam += (krediListe[i]*1.5);
      else if (harfNotListe[i] == "dd" || harfNotListe == "DD")
        toplam += (krediListe[i]*1);
      else if (harfNotListe[i] == "fd" || harfNotListe == "FD")
        toplam += (krediListe[i]*0.5);
      else if (harfNotListe[i] == "ff" || harfNotListe == "FF")
        toplam += (krediListe[i]*0);
      else 
        return -1;
      
    }
    return toplam/toplamKredi;

  }

  @override
  Widget build(BuildContext context) {
    double ekranU = MediaQuery.of(context).size.height;
    double ekranE = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GANO",
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            height: 1.7 * ekranU / 3,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: liste.length,
                    itemBuilder: (context, index) => liste[index],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: ekranU / 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              onPressed: () {
                veriKaydet();
                gano = ganoSonucHesapla();
                if (krediListe.length == 0){
                  ganoBilgi = "Ders giriniz";
                }
                else if (gano == -1){
                  ganoBilgi = "Yanlış veri girildi";
                  print(gano);
                }
                else if(gano == -2){
                  ganoBilgi == "Boş giriş bırakmayınız";
                  print(gano);
                }
                else{
                  ganoBilgi = "Ganonuz : ${double.parse((gano).toStringAsFixed(2))}";
                }
                setState(() {
                  
                });
              },
              child: Text("Sonucu Gör"),
            ),
          ),
          SizedBox(
            height: ekranU / 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              onPressed: () {
                liste = [];
                print(ganoBilgi);
                setState(() {
                  ganoBilgi = "";
                });
                print(ganoBilgi);
              },
              child: Text("Sıfırla"),
            ),
          ),
          SizedBox(
            height: ekranU / 40,
          ),
          Text(
            ganoBilgi,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: ekranU / 30),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listeEkle();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


