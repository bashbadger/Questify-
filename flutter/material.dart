import 'package:flutter/material.dart';

class AddQuestScreen extends StatefulWidget {
  @override
  _AddQuestScreenState createState() => _AddQuestScreenState();
}

class _AddQuestScreenState extends State<AddQuestScreen> {
  double _dreadLevel = 5;
  String _taskName = "";
  int _baseXP = 50;

  int get _calculatedXP => (_baseXP * (1 + (_dreadLevel / 10))).toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E), // Deep Focus Purple
      appBar: AppBar(title: Text("New Quest"), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("WHAT IS YOUR OBJECTIVE?", style: TextStyle(color: Colors.white70, letterSpacing: 1.5)),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 22),
              decoration: InputDecoration(hintText: "Enter task...", hintStyle: TextStyle(color: Colors.white24)),
              onChanged: (val) => setState(() => _taskName = val),
            ),
            SizedBox(height: 40),
            Text("DREAD FACTOR: ${_dreadLevel.toInt()}", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
            Slider(
              value: _dreadLevel,
              min: 1, max: 10, divisions: 9,
              activeColor: Colors.amber,
              onChanged: (val) => setState(() => _dreadLevel = val),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Text("POTENTIAL REWARD", style: TextStyle(color: Colors.white54)),
                  Text("${_calculatedXP} XP", style: TextStyle(color: Colors.greenAccent, fontSize: 48, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () { /* Logic to save to Firebase */ },
                child: Text("START QUEST", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
