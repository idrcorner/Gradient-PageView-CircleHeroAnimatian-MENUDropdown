import 'package:flutter/material.dart';
import './detail.dart';

void main(){
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

String gambar1="http://idrcorner.com/images/icon/gw.jpg";
String gambar2="https://inspired.disney.co.uk/wp-content/uploads/2017/04/disneyinspired-potc-quiz-v02-660x660-1.jpg";
String backup;

String nama1="Indra Armaulana";
String nama2="Jack Sparrow";
String backupnama;

void gantiuser(){
  this.setState((){
    backup=gambar1;
    gambar1=gambar2;
    gambar2=backup;

    backupnama=nama1;
    nama1=nama2;
    nama2=backupnama;
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Demo Sidebar (DRAWER)"),backgroundColor: Colors.red[700],),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountName: new Text(nama1),
              accountEmail: new Text("idrcorner@gmail.com"),
              currentAccountPicture:  
              new GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                     Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(nama: nama1, gambar: gambar1,)
                  ));
                  },
                  child: new CircleAvatar(
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              decoration:  new BoxDecoration(
                image: new DecorationImage(image: new NetworkImage("http://ichef.bbci.co.uk/images/ic/1600xn/p03gywjs.jpg"),
                fit: BoxFit.cover
                )
              ),
              otherAccountsPictures: <Widget>[
                
                new GestureDetector(
                  onTap: ()=> gantiuser(),
                   child:   new CircleAvatar( backgroundImage: new NetworkImage(gambar2),)
            
                )

                 ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close)
            ),
          ],
        ),
      ),
      body:new Center(
          child: new Image(
            image: new NetworkImage("http://idrcorner.com/assets/nn/imgs/logo.png",),width: 450.0,
          ),
      ),
    );
  }
}