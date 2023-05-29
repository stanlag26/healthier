import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthier/ui/navigation/my_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'api/awesome_notifications_push/notifications.dart';
import 'entity/course_hive.dart';
import 'entity/health_monitoring.dart';
import 'firebase_options.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CourseHiveAdapter());
  await Hive.openBox('user_box');
  Hive.registerAdapter(HealthMonitoringHiveAdapter());
  await Hive.openBox('healthMonitoring_box');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppMetrica.activate(const AppMetricaConfig("77553fa4-af39-4b16-ad52-248e33ad1524",logs: true));
  AppMetrica.reportEvent('My first AppMetrica event!');

  AwesomeNotifications().initialize(
    'resource://drawable/notification_icon',
    [
      NotificationChannel(

        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.white,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        channelDescription: 'basic_channel',
        locked: false,
        playSound: true,
        enableLights: true,
        enableVibration: true,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );
  AwesomeNotifications().setListeners(
      onActionReceivedMethod:         NotificationService.onActionReceivedMethod,
      // onNotificationCreatedMethod:    NotificationService.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:  NotificationService.onNotificationDisplayedMethod,
      // onDismissActionReceivedMethod:  NotificationService.onDismissActionReceivedMethod
      );

  // Получение списка запланированных уведомлений
  List<NotificationModel> scheduledNotifications = await AwesomeNotifications().listScheduledNotifications();

  // Печать информации о каждом запланированном уведомлении
  scheduledNotifications.forEach((notification) {
    print('Уведомление с id ${notification.content?.id} запланировано на ${notification.schedule..toString()}');
  });
  runApp( MyNavigation());
}

