import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthier/ui/navigation/my_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'api/awesome_notifications_push/notifications.dart';
import 'entity/course_hive.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CourseHiveAdapter());
  await Hive.openBox('user_box');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(

        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.white,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        channelDescription: 'basic_channel',
        locked: true,
        playSound: true,
        enableLights: true,
        enableVibration: true,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );
  AwesomeNotifications().setListeners(onActionReceivedMethod:NotificationService.onActionReceived);
  runApp(const MyNavigation());
}

