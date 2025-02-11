import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage('de-DE');
    await _flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        ],
        IosTextToSpeechAudioMode.voicePrompt);
    await _flutterTts.setPitch(0.8);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.awaitSpeakCompletion(true);
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
