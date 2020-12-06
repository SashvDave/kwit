import 'package:flutter/material.dart';

import 'anger1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kwit")),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Anger"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Anger1()));
              },
            ),
            RaisedButton(
              child: Text("Anger"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Anger1()));
              },
            ),
            RaisedButton(
              child: Text("Anger"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Anger1()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
