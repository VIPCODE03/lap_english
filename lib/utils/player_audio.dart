
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerUtil {
  final AudioPlayer _player = AudioPlayer();
  PlayerState? _playerState;

  AudioPlayerUtil() {
    _player.setVolume(0.25);
    _player.onPlayerComplete.listen((event) {
      _playerState = PlayerState.stopped;
      _onPlaybackComplete();
    });
  }

  //=== Phát nhạc ===
  Future<void> play(Sound sound) async {
    switch(sound) {
      case Sound.wrong:
        await _player.setSourceAsset("sounds/wrong.mp3");
        break;
      case Sound.close:
        await _player.setSourceAsset("sounds/fbi.mp3");
        break;
      case Sound.correct:
        await _player.setSourceAsset("sounds/correct.mp3");
        break;
    }

    await _player.resume();
    _playerState = PlayerState.playing;
  }

  //===  Tạm dừng  ===
  Future<void> pause() async {
    await _player.pause();
    _playerState = PlayerState.paused;
  }

  //=== Dừng  ===
  Future<void> stop() async {
    await _player.stop();
    _playerState = PlayerState.stopped;
  }

  //=== Xử lý sau khi hoàn thành  ===
  void _onPlaybackComplete() {
    if(_playerState == PlayerState.playing) {
      _player.stop();
    }
  }

  //=== Giải phóng dữ liệu  ===
  void dispose() {
    _player.dispose();
  }
}

enum Sound {
  correct,
  wrong,
  close,
}