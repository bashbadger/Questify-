import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class GuardianEngine {
  bool isTracking = false;
  double movementIntensity = 0.0;
  StreamSubscription? _subscription;

  // Sensitivity threshold (Adjustable based on task)
  final double sensitivity = 1.5; 

  void startTracking({required Function onMovementDetected}) {
    isTracking = true;
    
    // Listen to the phone's physical motion
    _subscription = userAcceleratorEvents.listen((UserAccelerometerEvent event) {
      if (!isTracking) return;

      // Calculate the magnitude of the movement (3D vector math)
      // Formula: sqrt(x² + y² + z²)
      double force = (event.x.abs() + event.y.abs() + event.z.abs());

      if (force > sensitivity) {
        movementIntensity += force;
        onMovementDetected(movementIntensity);
      }
    });
  }

  void stopTracking() {
    isTracking = false;
    _subscription?.cancel();
    movementIntensity = 0.0;
  }
}
