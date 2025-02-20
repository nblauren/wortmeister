import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';

class PlayButton extends StatelessWidget {
  final String word;

  const PlayButton({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayButtonNotifier(),
      child: Consumer<PlayButtonNotifier>(
        builder: (context, model, child) {
          return FloatingActionButton(
            elevation: 0,
            child: Icon(Icons.volume_up),
            onPressed: () {
              model.togglePlay(word);
            },
          );
        },
      ),
    );
  }
}

class PlayButtonNotifier extends ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void togglePlay(String word) async {
    if (_isPlaying) {
      await LocatorService.tTSService.stop();
    } else {
      await LocatorService.tTSService.speak(word);
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}
