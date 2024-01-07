import 'package:flutter/material.dart';
import 'package:scouting2024/pages/scout.dart';
import 'package:scouting2024/widgets/dropdown.dart';
import 'package:scouting2024/data/scouters.dart';
import 'package:scouting2024/data/teams.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

late SharedPreferences prefs;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String? scouterName;
  String? teamNumber;

  final matchNumber = TextEditingController();

  @override
  void initState() async {
    super.initState();
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOUPERBots | Scouting 2024"),
        centerTitle: true,
      ),
      body: ListView(
        children: [ Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset('assets/frc203.png'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Text('Red 3',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      decoration: TextDecoration.none,
                    )
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: Dropdown203(options: scouters, selected: (prefs.containsKey("name") ? scouterName : prefs.getString("name")), hintText: "Select Your Name",
                callback: (p0) {
                  setState(() {
                    scouterName = p0;
                  });
                }) 
              ),              // Padding(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: Dropdown203(options: teams, selected: teamNumber, hintText: "Select The Team You're Scouting",
                callback: (p0) {
                  setState(() {
                    teamNumber = p0;
                  });
                }) 
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  controller: matchNumber,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the match number you are scouting';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70, width: 2)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    hintText: 'Enter Match Number',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(50),
                child: ButtonTheme(
                  minWidth: 500,
                  height: 100,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        // side: const BorderSide(color: Colors.white)
                      )),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(50, 25, 50, 25))
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        prefs.setString('name', scouterName!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoutPage(
                              scouterName: scouterName,
                              teamNumber: teamNumber,
                              matchNumber: matchNumber.text
                            )),
                        );
                      }
                    },
                    child: const Text('Continue',
                      style: TextStyle(fontSize: 25)
                    ),
                  )
                )
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Please Return To Team 203 If Found',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ]
          )
        ),
      ])
    );
  }
}
