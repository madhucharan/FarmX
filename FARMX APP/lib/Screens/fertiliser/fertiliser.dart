import 'package:flutter/material.dart';

class fertiliser_predict extends StatefulWidget {
  @override
  _riskState createState() => _riskState();
}

class _riskState extends State<fertiliser_predict> {
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

  String selectedState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text('Crop Prediction'),
          backgroundColor: Colors.greenAccent[400],
          actions: [],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 20.0,
          ),
          child: Form(
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
                  ),
                ),
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
                  ),
                ),
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
                      color: Colors.blueAccent,
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          print('success');
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
