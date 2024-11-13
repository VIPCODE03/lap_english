
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioPlayerUtil {
  final AudioPlayer _player = AudioPlayer();
  PlayerState? _playerState;

  AudioPlayerUtil() {
    _player.onPlayerComplete.listen((event) {
      _playerState = PlayerState.stopped;
      _onPlaybackComplete();
    });
  }

  //=== Set độ to ===
  void setVolume(double value) {
    _player.setVolume(value);
  }

  //=== Phát nhạc ===
  Future<void> play(Sound sound) async {
    if(_playerState == PlayerState.playing) stop();
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

  //=== Phát asset ===
  Future<void> playFromAsset(String url) async {
    try {
      if(_playerState == PlayerState.playing) stop();
      var assetsUrl = url.startsWith('assets/')
          ? url.replaceFirst('assets/', '')
          : url;
      await _player.setSourceAsset(assetsUrl);
      _playerState = PlayerState.playing;
      await _player.resume();
    } catch (e) {
      if (kDebugMode) {
        print("Error playing audio: $e");
      }
    }
  }

  //=== Phát url ===
  Future<void> playFromUrl(String url) async {
    try {
      if(_playerState == PlayerState.playing) stop();
      await _player.setSourceUrl(url);
      _playerState = PlayerState.playing;
      await _player.resume();
    } catch (e) {
      if (kDebugMode) {
        print("Error playing audio: $e");
      }
    }
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