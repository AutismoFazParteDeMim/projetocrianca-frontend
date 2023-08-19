import 'package:vibration/vibration.dart';

mixin VibrationMixin {
  Future<void> vibrate({int? duration}) async {
    if (await Vibration.hasVibrator() != null) {
      await Vibration.vibrate(duration: duration ?? 1000);
    }
  }
}
