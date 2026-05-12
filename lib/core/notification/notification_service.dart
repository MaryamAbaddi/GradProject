


import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();


    static Future<void> init() async {
      const AndroidInitializationSettings android =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings settings =
          InitializationSettings(android: android);

      await _plugin.initialize(settings);

      _plugin.resolvePlatformSpecificImplementation
          <AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async{
    await _plugin.show(
      0,
      title,
      body, 
      const NotificationDetails(
        android: AndroidNotificationDetails(
           'channel_id',
          'channel_name',
          importance: Importance.high,
          priority: Priority.high
        )
      )
    );
  }
}