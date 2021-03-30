import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/crop_prediciton/cropdetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<dynamic, dynamic>> predictCropInfo(var body) async {
  var client = new http.Client();
  var uri =
      Uri.parse("https://farmx-crop-recommendation.herokuapp.com/cropsuggest");
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsonString = json.encode(body);
  print(jsonString);
  try {
    var resp = await http.post(uri, headers: headers, body: jsonString);
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      print("DATA FETCHED SUCCESSFULLY");
      Map<dynamic, dynamic> result = json.decode(resp.body);
      print(result);
      final Map<dynamic, dynamic> data =
          result.map((key, value) => MapEntry(key.toString(), value));
      print(data['suggestion'].keys);
      print(data['suggestion'].values);
      print(data['suggestion'].keys.runtimeType);
      print('heyyiii');
      return data;
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

class prediction extends StatefulWidget {
  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<prediction> {
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

  String selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text('Crop Prediction'),
          backgroundColor: Colors.green[400],
          actions: [],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: Center(
              child: Form(
                key: _key,
                child: Center(
                  child: Column(
                    children: <Widget>[
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
                                  'State': selectedState,
                                }
                              ];
                              print(body);
                              Map<dynamic, dynamic> resp =
                                  await predictCropInfo(body);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return cropdetails(resp);
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
            ),
          ),
        ));
  }
}

class cropdetails extends StatelessWidget {
  Map<dynamic, dynamic> info;

  List keys, values;
  cropdetails(Map<dynamic, dynamic> resp) {
    info = resp;
    keys = info['suggestion'].keys.toList();
    values = info['suggestion'].values.toList();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Crop Suggestions'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Container(
            child: Center(
              child: ListView(
                children: [
                  Text(
                    'These are the suggested crop varieties in your selected region.',
                  ),
                  SizedBox(height: 10),
                  DataTable(
                    dataRowHeight: 60,
                    columns: [
                      DataColumn(label: Text('Crop')),
                      DataColumn(label: Text('Variety')),
                    ],
                    rows: List.generate(
                        keys.length,
                        (index) => DataRow(cells: [
                              DataCell(Text(keys[index])),
                              DataCell(Text(values[index])),
                            ])),
                  ),
                  SizedBox(height: 10),
                  // Text(),
                  SizedBox(height: 10),
                  FlatButton(
                      color: Colors.green[400],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return tableview();
                            },
                          ),
                        );
                      },
                      child: new Text('View Conditions'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
