import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class AlarmService{
  static final FlutterLocalNotificationsPlugin _plugin=FlutterLocalNotificationsPlugin();
  static Future<void> init() async{
    tz_data.initializeTimeZones();
    const AndroidInitializationSettings androidSettings= AndroidInitializationSettings(@mipmap/ic_launcher);
    const InitializationSettings settings= InitializationSettings(android: androidSettings);
    await _plugin.initialize(settings);

    await _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }
  
}