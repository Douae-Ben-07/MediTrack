import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'database_helper.dart';//importation de ficher de la base de donnee

class AlarmService{
  static final FlutterLocalNotificationsPlugin _plugin=FlutterLocalNotificationsPlugin();
  static Future<void> init() async{
    tz_data.initializeTimeZones();
    const AndroidInitializationSettings androidSettings= AndroidInitializationSettings(@mipmap/ic_launcher);
    const InitializationSettings settings= InitializationSettings(android: androidSettings);
    await _plugin.initialize(settings);

    await _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }
  static Future<void> programmerAlarmTraitement({
    required Traitement traitement,
    required Medicament medicament,
  }) async{
    //verifier si le traitement n'est pas terminee
    DateTime Aujourdhui = DateTime.now();
    DateTime finTraitement= DateTime.parse(traitement.dateFin);

    if(aujourdhui.isAfter(finTraitement)){
      //Annuler alarme si le traitement est fini
      await annulerAlarm(traitement.id);
      return;
    }
    //extraire heure et minutes depuis heurPrise
    List<String> partiesHeure = traitement.heurePrise.split(':');
    int heure = int.parse(partiesHeure[0]);
    int minute = int.parse(partiesHeure[1]);
    tz.TZDateTime maintenant =tz.TZDateTime.now(tz.local);
    tz.TZDateTime dateProgrammee= tz.TZDateTime(
      tz.local,
      maintenant.year,
      maintenant.month,
      maintenant.day,
      heure,
      minute,
    );
    if (dateProgrammee.isBefore(maintenant)) {
      dateProgrammee = dateProgrammee.add(const Duration(days: 1));
    } 
  }
}