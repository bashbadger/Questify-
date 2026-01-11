import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Essential for Guardian Engine

void main() => runApp(QuestFundApp());

class QuestFundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0C29),
        primaryColor: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _userXP = 0;
  double _jackpot = 1450.75;
  
  // The Leaderboard Masked Data
  final List<Map<String, dynamic>> _leaderboard = [
    {"name": "Ma*****", "xp": 1200},
    {"name": "Lo*****", "xp": 950},
    {"name": "An*****", "xp": 800},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildXPProgress(),
            Expanded(child: _buildLeaderboard()),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("MONTHLY JACKPOT", style: TextStyle(color: Colors.white54)),
          Text("\$${_jackpot.toStringAsFixed(2)}", 
               style: TextStyle(fontSize: 42, color: Colors.amber, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLeaderboard() {
    return ListView.builder(
      itemCount: _leaderboard.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text("#${index + 1}", style: TextStyle(color: Colors.amber)),
          title: Text(_leaderboard[index]['name']),
          trailing: Text("${_leaderboard[index]['xp']} XP"),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber, minimumSize: Size(double.infinity, 60)),
        onPressed: () { /* Navigate to Add Task */ },
        child: Text("NEW QUEST", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildXPProgress() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text("Your XP: $_userXP", style: TextStyle(fontSize: 24)),
    );
  }
}
