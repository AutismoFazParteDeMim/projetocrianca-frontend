import 'package:audioplayers/audioplayers.dart';

mixin AudioMixin {
  void playButtonClickAudio() {
    AudioPlayer().play(AssetSource('audio/button_click.mp3'));
  }
}
