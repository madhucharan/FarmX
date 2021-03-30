import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/crop_prediciton/cropdetails.dart';
import 'package:flutter_auth/cost_predict/predict.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class costprediction extends StatefulWidget {
  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<costprediction> {
  final _key = GlobalKey<FormState>();
  final List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh ",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "National Capital Territory of Delhi",
    "Puducherry"
  ];

  List years = [];

  String selectedState;
  double year;

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
          title: Text('Crop Prediction'),
          backgroundColor: Colors.green[400],
          actions: [],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 20.0,
          ),
          child: Form(
            key: _key,
            child: Center(
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
                          labelText: 'Enter the Current Year',
                          hintText: 'Enter a Value.',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      onChanged: (value) {
                        year = double.parse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, width: 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DropdownButton(
                        hint: Text('Select a state'),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        value: selectedState,
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                          });
                        },
                        items: states.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        child: Text('Submit'),
                        textColor: Colors.white,
                        color: Colors.green[400],
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            print('success');
                          }
                          var body = [
                            {
                              'year': year,
                              'State': selectedState,
                            }
                          ];
                          print(body);
                          //var resp = await predictFertiliser(body);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return costpredict();
                              },
                            ),
                          );
                          print('okay');
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
