import 'package:flutter/material.dart';
import 'places.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Ñom Ñom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Place> _places = <Place>[];
  // List<String> _places = <String>[];
  @override
  initState() {
    super.initState();
    listenForPlaces();
  }

  listenForPlaces() async {
    var stream = await getPlaces(33.9850, -118.4695);
    stream.listen((place) => setState(() => _places.add(place)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new ListView(
        children: _places.map((place) => new PlaceWidget(place)).toList(),
      )),
    );
  }
}

class PlaceWidget extends StatelessWidget {
  final Place _place;
  PlaceWidget(this._place);

  @override
  Widget build(BuildContext context0) {
    return  new ListTile(
      leading: new CircleAvatar(
        child: new Text(_place.rating.toString()),
        backgroundColor: Colors.green,
      ),
      title: new Text(_place.name),
      subtitle: new Text(_place.address),
    );
  }
}