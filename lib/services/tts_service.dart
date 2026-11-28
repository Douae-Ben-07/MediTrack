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

  // Reglages de base (Langue francaise, vitesse moyenne, volume max)
  await flutterTts.setLanguage("fr-FR");
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setVolume(1.0);
  await flutterTts.setPitch(1.0);

  //Gerer les evenements (debut, fin, annulation, erreur)
  flutterTts.setStartHandler((){
    isSpeaking = true;
  });

  flutterTts.setCompletionHandler((){
    isSpeaking = false;
  });

  flutterTts.setCancelHandler((){
    isSpeaking = false;
  });

  flutterTts.setErrorHandler((message){
    isSpeaking = false;
    print("Erreur TTS: $message");
  });
   isInitialized = true;
}