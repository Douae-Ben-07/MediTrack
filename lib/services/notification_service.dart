import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class notificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  //configuration pour Android
  static const _channelId = 'mediTrack_rappels';
  static const _channelName = 'Rappels MideTrack';
  static const _channelDescription = 'Rappel horaire de prise';

  //initialiser timezone du base donnees et parametre du notifications
  static Future<void> init() async {
    tz_data.initializeTimeZones();
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(initSettings);
  }

  static Future<void> scheduleReminder({
    required int id_t,
    required String nom,
    required String dosage,
    required String nom_trait,
    required DateTime heur_prise,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);
    final tzScheduledTime = tz.TZDateTime.from(heur_prise, tz.local);
    await _notifications.zonedSchedule(
      id_t,
      'Heure du medicament -$nom_trait',
      '$nom-$dosage: C est l heure de la prise!',
      tzScheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelRappel(int id_t) async {
    await _notifications.cancel(id_t);
  }

  static Future<void> cancelAll() async {
    await _notifications.cancelAll();
  }
}