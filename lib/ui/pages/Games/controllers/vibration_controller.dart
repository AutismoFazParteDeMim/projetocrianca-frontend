import 'package:vibration/vibration.dart';

class VibrationController {
  Future<void> vibrate({int? duration}) async {
    if (await Vibration.hasVibrator() != null) {
      Vibration.vibrate(duration: duration ?? 1000);
    }
  }
}
