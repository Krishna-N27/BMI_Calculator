import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.cyan,
  ),
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 175.0;
  double _weight = 60.0;
  int _bmi = 0;
  String _condition = 'Select Data';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: size.height * 0.40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BMI",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0),
                    ),
                    Text(
                      "CALCULATOR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "$_bmi",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Condition:",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 25.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "$_condition",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.black87,
                                  ))
                            ]))
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text("Choose Data",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Height:",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${_height.toStringAsFixed(2)} cm",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                            ])),
                    Slider(
                      value: _height,
                      min: 0,
                      max: 250,
                      onChanged: (height) {
                        setState(() {
                          _height = height;
                        });
                      },
                      divisions: 150,
                      label: _height.toStringAsFixed(2),
                      activeColor: Colors.black,
                      inactiveColor: Colors.red,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Weight:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "${_weight.toStringAsFixed(2)} Kg",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.black87,
                                )),
                          ]),
                    ),
                    Slider(
                      value: _weight,
                      min: 0,
                      max: 250,
                      onChanged: (weight) {
                        setState(() {
                          _weight = weight;
                        });
                      },
                      divisions: 300,
                      label: _weight.toStringAsFixed(2),
                      activeColor: Colors.black,
                      inactiveColor: Colors.red,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _bmi = (_weight /
                                  ((_height / 100) * (_height / 100)))
                                  .round()
                                  .toInt();
                              if (_bmi >= 18.5 && _bmi <= 25) {
                                _condition = "Normal";
                              } else if (_bmi > 25 && _bmi <= 30) {
                                _condition = "Overweight";
                              } else if (_bmi > 30) {
                                _condition = "Obseity";
                              } else {
                                _condition = "UnderWeight";
                              }
                            });
                          },
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
