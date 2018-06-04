import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                colors: [
              Colors.red,
              Colors.yellow,
              Colors.green,
            ])),
        child: new PageView.builder(
          controller: new PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i) {
            return new Padding(
              padding:
                  new EdgeInsets.symmetric(horizontal: 5.0, vertical: 22.0),
              child: new Material(
                borderRadius: new BorderRadius.circular(15.0),
                elevation: 8.0,
                child: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Hero(
                      tag: gambar[i],
                      child: new Material(
                        child: new InkWell(
                            onTap: () => Navigator
                                .of(context)
                                .push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Halamandua(
                                        gambar: gambar[i],
                                      ),
                                )),
                            child: new Image.asset(
                              "img/${gambar[i]}",
                              fit: BoxFit.cover,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({this.gambar});
  final String gambar;


  @override
  HalamanduaState createState() {
    return new HalamanduaState();
  }
}

class HalamanduaState extends State<Halamandua> {

Color warna=Colors.grey;

void _pilihannya(Pilihan pilihan){
  setState((){
  
  });  warna=pilihan.warna;
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DOTA HERO"),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context){
              return listPilihan.map((Pilihan x){
                  return new PopupMenuItem<Pilihan>(
                    child: new Text(x.teks),
                    value: x,
                  );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              gradient: new RadialGradient(
                center: Alignment.center,
                colors: [
                  Colors.blue,
                  warna,
                  Colors.black.withOpacity(0.9),
                ]
              )
            ),
          ),
          new Center(
            child: new Hero(
              tag: widget.gambar,
              child: new ClipOval(
                child: new SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Image.asset("img/${widget.gambar}",fit:  BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pilihan{
  const Pilihan({this.teks,this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan (teks: "Strength", warna: Colors.red),
  const Pilihan (teks: "Agility", warna: Colors.green),
  const Pilihan (teks: "Intelligence", warna: Colors.blue),
];
