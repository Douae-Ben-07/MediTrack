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

//Fonction pour changer la langue (Français, Arabe, Anglais)
//Les codes utilises sont: "fr-FR", "ar-SA", "en-US"
Future<void> changeLanguage(String languageCode) async {
  currentLanguage = languageCode;
  await flutterTts.setLanguage(languageCode);
}

//Fonction generale pour lire n'importe quel texte
Future<void> speak(String text) async {
  if (isInitialized == false) {
    await init();
  }

  if (text.trim().isEmpty) {
    return;
  }
  await flutterTts.stop();
  await flutterTts.speak(text);
}

//fontion pour le rappel d'un medicament selon la langue choisie
Future<void> speakMedicamentReminder(String nomMedicament, String dose) async {
  String message = "";

  if (currentLanguage == "ar-SA") {
    message = "تذكير : حان وقت تناول الدواء $nomMedicament، الجرعة $dose";
  } else if (currentLanguage == "en-US") {
    message = "Reminder: Please take your medicine $nomMedicament, dose $dose";
  } else {
    //Français par defaut
    message = "Rappel : Prenez votre médicament $nomMedicament, dose $dose";
  }

await speak(message);
}

//Fonction pour lire un message d'alarme
Future<void> speakAlarm(String message) async {
  await speak(message);
}

//Fonction pour arreter la voix
Future<void> stop() async {
  await flutterTts.stop();
  isSpeaking = false;
}