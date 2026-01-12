
// Inside your ActiveQuestState class:

int _secondsInactive = 0;
Timer? _timer;

void startGuardian() {
  _guardianEngine.startTracking(onMovementDetected: (intensity) {
    setState(() {
      _secondsInactive = 0; // Reset "Laziness" timer because movement was detected
      _totalXPAccumulated += 1; // Passive XP gain for staying active
    });
  });

  // Background timer to check for inactivity
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    _secondsInactive++;
    
    if (_secondsInactive > 60) {
      triggerADHDAlert(); // Vibration + Sound to nudge the user
    }
  });
}

// Inside your ActiveQuestState class:

int _secondsInactive = 0;
Timer? _timer;

void startGuardian() {
  _guardianEngine.startTracking(onMovementDetected: (intensity) {
    setState(() {
      _secondsInactive = 0; // Reset "Laziness" timer because movement was detected
      _totalXPAccumulated += 1; // Passive XP gain for staying active
    });
  });

  // Background timer to check for inactivity
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    _secondsInactive++;
    
    if (_secondsInactive > 60) {
      triggerADHDAlert(); // Vibration + Sound to nudge the user
    }
  });
}

void triggerADHDAlert() {
  HapticFeedback.vibrate();
  print("⚠️ ARE YOU STILL THERE? Movement has stopped!");
}

void triggerADHDAlert() {
  HapticFeedback.vibrate();
  print("⚠️ ARE YOU STILL THERE? Movement has stopped!");
}
