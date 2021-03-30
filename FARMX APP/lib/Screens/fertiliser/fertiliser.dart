import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class fertiliser_predict extends StatefulWidget {
  @override
  _riskState createState() => _riskState();
}

class _riskState extends State<fertiliser_predict> {
  final _key = GlobalKey<FormState>();

  final List<String> soiltype = ['Sandy', 'Loamy', 'Black', 'Red', 'Clayey'];
  final List<String> croptype = [
    'Maize',
    'Sugarcane',
    'Cotton',
    'Tobacco',
    'Paddy',
    'Barley',
    'Wheat',
    'Millets',
    'Oil seeds',
    'Pulses',
    'Ground Nuts'
  ];

  double n, p, k, temperature, humidity, moisture;
  String selectedsoiltype;
  String selectedcroptype;

  var crop_type = {
    'Barley': 5,
    'Cotton': 2,
    'Ground Nuts': 10,
    'Maize': 0,
    'Millets': 7,
    'Oil seeds': 8,
    'Paddy': 4,
    'Pulses': 9,
    'Sugarcane': 1,
    'Tobacco': 3,
    'Wheat': 6
  };

  var soil_type = {"Sandy": 1, "Loamy": 2, "Black": 3, "Red": 4, "Clayey": 5};

  Future<String> predictFertiliser(var body) async {
    var client = new http.Client();
    var uri =
        Uri.parse("https://farmx-crop-recommendation.herokuapp.com/fertrec");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
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
          title: Text('Fertiliser Prediction'),
          backgroundColor: Colors.green[600],
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
                          n = double.parse(value);
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
                            labelText: 'Phosphorous',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          p = double.parse(value);
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
                            labelText: 'Potassium(K)',
                            hintText: 'Enter a Value from 0 to 14.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          k = double.parse(value);
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
                            labelText: 'Moisture',
                            hintText: 'Enter a Value.',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        onChanged: (value) {
                          moisture = double.parse(value);
                        },
                      ),
                    ), //moisture

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: DropdownButton(
                          hint: Text('Select a SoilType'),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          value: selectedsoiltype,
                          onChanged: (value) {
                            setState(() {
                              selectedsoiltype = value;
                            });
                          },
                          items: soiltype.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ), //soiltype

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: DropdownButton(
                          hint: Text('Select a CropType'),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          value: selectedcroptype,
                          onChanged: (value) {
                            setState(() {
                              selectedcroptype = value;
                            });
                          },
                          items: croptype.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ), //croptype

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          child: Text('Submit'),
                          textColor: Colors.white,
                          color: Colors.green[600],
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
                                'moisture': moisture,
                                'Soil Type': soil_type[selectedsoiltype],
                                'Crop Type': crop_type[selectedcroptype],
                              }
                            ];

                            print(body);
                            var resp = await predictFertiliser(body);
                            _onBasicAlertPressed(context, resp);
                          }),
                    )
                  ],
                ),
              ),
            )));
  }

  _onBasicAlertPressed(context, resp) {
    Alert(context: context, title: "Recommended Fertilizer is", desc: resp)
        .show();
  }
}
