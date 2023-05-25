import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../ui/my_courses/courses/hive_courses.dart';
import '../../ui/navigation/my_navigation.dart';
import '../main_navigation/main_navigation.dart';
import 'dart:core';



class NotificationService {
  static Future<void> createNotification(
      {required int notificationId,
      required String name,
      required String description,
      required String photo,
      required int hour,
      required int minute,
      int periodicity = 0,
      required DateTime startNamePill}) async {
    final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();


    DateTime initialDateTime = DateTime.now();
    DateTime expirationDateTime = DateTime(2024, 5, 17, 9, 0);

    NotificationCalendar schedule = NotificationCalendar(
      hour: hour,
      minute: minute,
      second: 0,
      millisecond: 0,
      repeats: true,
      timeZone: timeZone,
      allowWhileIdle: true,
      preciseAlarm: true,
    );

    final content = NotificationContent(
      id: notificationId,
      channelKey: 'basic_channel',
      title: name,
      body: description,
      icon: 'resource://drawable/notification_icon',
      bigPicture: photo,
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      autoDismissible: true,
      locked: false,
      payload: {'periodicity': periodicity.toString()},
    );


    await AwesomeNotifications().createNotification(
      content: content,
      schedule: schedule,
    );
  }


  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {

    print('object');

  }
  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    int id = receivedAction.id!;
    String? title = receivedAction.title;
    String? body = receivedAction.body;
    String? bigPicture = receivedAction.bigPicture;
      // Обработка нажатия на уведомление без нажатия на кнопки с передачей полезной нагрузки
    await MyNavigation.navigatorKey.currentState?.pushNamedAndRemoveUntil(MainNavigationRouteNames.coursesView,
            (route) => (route.settings.name != MainNavigationRouteNames.coursesView) || route.isFirst,
        arguments: [title, body, bigPicture]);

    // MyNavigation.navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (context) => YourCoursesView(
    //       arguments: [title, body, bigPicture],
    //     ),
    //   ),
    // );



  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
    // await AwesomeNotificationsPlatform.instance.resetGlobalBadge();
  }
}
