import 'package:flutter_tts/flutter_tts.dart';

class NovaVoice {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.setLanguage('es-MX');
    await _tts.setPitch(0.5);
    await _tts.speak(text);
  }
}
