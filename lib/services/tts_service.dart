import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  //Creation de l'objet principal pour la synthèse vocale
  FlutterTts flutterTts = FlutterTts();

  //variables pour suivi l'etat de lecture(initialise ou en cours)
  bool isInitialized = false;
  bool isSpeaking = false;

  //Fonction pour preparer et configurer la voix
  Future<void> init() async {
    // Si c'est deja prêt, on ne refait pas la configuration
    if (isInitialized == true) {
      return;
    }
  }
}