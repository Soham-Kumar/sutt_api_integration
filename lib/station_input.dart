import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String journeyStart = '';
  String journeyEnd = '';
  TextEditingController journeyStartTEC = TextEditingController();
  TextEditingController journeyEndTEC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.jpg'),
            fit: BoxFit.cover,
          ),

        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: journeyStartTEC,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: journeyEndTEC,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    journeyStart = journeyStartTEC.text;
                    journeyEnd = journeyEndTEC.text;
                    print(journeyStart);
                    print(journeyEnd);
                  });
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainData( journeyStart: journeyStart.toString() , journeyEnd: journeyEnd.toString(),),
                      ));
                },
                child: const Text(
                  'Get Trains',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}