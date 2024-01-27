import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";

  var _number = ["0"];
  int _index = 0;

  Widget buildButton(String label) {
    return InkWell(
      onTap: () {
        setState(() {
          if (label != _number[0]) {
            _number[0] = "";
            _number.add(label);
            _index++;
          }
        });
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Center(child: Text(label, style: TextStyle(fontSize: 30))),
      ),
    );
  }

  Widget buildOperatorButton(String label) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_number.length != 1) {
            _number[0] = "";
            _number.add(label);
            _index++;
          }
        });
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Center(child: Text(label, style: TextStyle(fontSize: 30))),
      ),
    );
  }

  Widget buildClearButton(String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _number = ["0"];
          _index = 0;
        });
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Center(child: Text(label, style: TextStyle(fontSize: 30))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calculate, color: Colors.green, size: 40),
                  Text("MY CALCULATOR", style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var index in _number)
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(index.toString(),
                            style: TextStyle(fontSize: 50)))
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: buildClearButton("C")),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (_number.length != 1) {
                                  _number.removeLast();
                                  _index--;
                                }
                                if (_index < 1) {
                                  _number = ["0"];
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              height: 80,
                              child: Icon(
                                Icons.backspace_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: buildButton("7")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("8")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("9")),
                        SizedBox(width: 10),
                        Expanded(child: buildOperatorButton(divideSign)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: buildButton("4")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("5")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("6")),
                        SizedBox(width: 10),
                        Expanded(child: buildOperatorButton(multiplySign)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: buildButton("1")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("2")),
                        SizedBox(width: 10),
                        Expanded(child: buildButton("3")),
                        SizedBox(width: 10),
                        Expanded(child: buildOperatorButton(subtractSign)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: buildButton("0"), flex: 3),
                        SizedBox(width: 10),
                        Expanded(child: buildOperatorButton(addSign), flex: 1),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [Expanded(child: buildClearButton(equalSign))],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
