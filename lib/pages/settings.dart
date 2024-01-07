import 'package:flutter/material.dart';
import 'package:scouting2024/widgets/formText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final assignedRobot = TextEditingController();

  @override
  void initState() async {
    super.initState();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("robot")) {
      setState(() {
        assignedRobot.text = prefs.getString("robot")!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOUPERBots | Settings"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.red,
        onTap: (int index) async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('robot', assignedRobot.text);
          switch (index) {
            case 0:
              Navigator.pop(context);
          }
        },
      ),
      body: ListView(
        children: [
          const SizedBox(height: 22),
          FormText203(text: "Assigned Robot:"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              controller: assignedRobot,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70, width: 2)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                hintText: 'Please contact the scouting leader if this is blank',
              ),
            ),
          ),
        ],
      )
    );
  }
}
