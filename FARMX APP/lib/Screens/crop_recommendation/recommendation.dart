import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class recommendation extends StatefulWidget {
  @override
  _riskState createState() => _riskState();
}

class _riskState extends State<recommendation> {
  final _key = GlobalKey<FormState>();

  final List<String> states = [
    'AndhraPradesh',
    'TamilNadu',
    'UP',
    'Kerala',
    'Karnataka',
    'Maharastra',
    'Gujarat'
  ];

  int n, p, k;
  double temperature, humidity, pH, rainfall;

  Future<String> predictCrop(var body) async {
    var client = new http.Client();
    var uri =
        Uri.parse("https://farmx-crop-recommendation.herokuapp.com/croprec");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    print(jsonString);
    try {
      var resp = await http.post(uri, headers: headers, body: jsonString);
      print(resp.statusCode);
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(result);
        print(result['prediction']);
        return result["prediction"];
      } else if (resp.statusCode == 405) {
        print("405 status code");
      } else {
        print("failed");
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text('Crop Recommendation'),
          backgroundColor: Colors.blueAccent[400],
          actions: [],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Nitrogen',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          n = int.parse(value);
                        },
                      ),
                    ), //nitrogen
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Phosphate',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          p = int.parse(value);
                        },
                      ),
                    ), //phosphorous
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'pH',
                            hintText: 'Enter a Value from 0 to 14.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          pH = double.parse(value);
                        },
                      ),
                    ),
                    //pH
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Potassium(k)',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          k = int.parse(value);
                        },
                      ),
                    ), //k

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Temperature',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          temperature = double.parse(value);
                        },
                      ),
                    ), //temperature

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Humidity',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          humidity = double.parse(value);
                        },
                      ),
                    ), //humidity

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'It cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Rainfall',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          rainfall = double.parse(value);
                        },
                      ),
                    ), //rainfall

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          child: Text('Submit'),
                          textColor: Colors.white,
                          color: Colors.blueAccent,
                          onPressed: () async {
                            if (_key.currentState.validate()) {
                              print('success');
                            }
                            var body = [
                              {
                                'N': n,
                                'P': p,
                                'K': k,
                                'temperature': temperature,
                                'humidity': humidity,
                                'ph': pH,
                                'rainfall': rainfall
                              }
                            ];
                            print('Hello');
                            print(body);
                            var resp = await predictCrop(body);
                            _onBasicAlertPressed(context, resp);
                          }),
                    )
                  ],
                ),
              ),
            )));
  }

  _onBasicAlertPressed(context, resp) {
    Alert(context: context, title: "Recommended Crop is", desc: resp).show();
  }
}
