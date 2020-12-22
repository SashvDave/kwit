import 'package:flutter/material.dart';
import './anger3.dart';
import './anger1.dart';
import 'dart:async';

class Anger2 extends StatefulWidget {
  @override
  _Anger2State createState() => _Anger2State();
}

class _Anger2State extends State<Anger2> {
  final _textController = TextEditingController();
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 73;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  void initState() {
    super.initState();
    startTimeout();
  }

  void goBack() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anger1()));
  }

  void _submitData() {
    final enteredText = _textController.text;

    if (enteredText.isEmpty) {
      return;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Anger3()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFDBEDFF),
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.1, 0, 0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.timer),
                  SizedBox(
                    width: 5,
                  ),
                  Text(timerText)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "Write down all the people of things that make you angry and why. Try to adhere to the time as much as possible."),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/waterdrop.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    minLines: 5,
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: 'Enter answer here ...',
                      filled: true,
                      fillColor: Color(0xFFDBEDFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: _textController,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => goBack(),
                      tooltip: "Go to last page",
                      iconSize: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => _submitData(),
                      tooltip: "Go to next page",
                      iconSize: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
