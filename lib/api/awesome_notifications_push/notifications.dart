import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ui/my_courses/courses/hive_courses.dart';
import '../main_navigation/main_navigation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  static Future<void> createNotification(
      {required int notificationId,
      required String name,
      required String description,
      required String photo,
      required int hour,
      required int minute,
      required int periodicity,
      required DateTime startNamePill}) async {
    final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    final now = DateTime.now();

    NotificationCalendar schedule = NotificationCalendar(
      weekday: now.weekday,
      day: now.day,
      hour: hour,
      minute: minute,
      second: 0,
      millisecond: 0,
      repeats: true,
      timeZone: timeZone,
      allowWhileIdle: true,
      preciseAlarm: true,
    );

    if (periodicity == 0) {
      if (startNamePill != now) {
          schedule = NotificationCalendar(
            weekday: now.weekday,
            day: now.day,
            hour: hour,
            minute: minute,
            second: 0,
            millisecond: 0,
            repeats: true,
            timeZone: timeZone,
            allowWhileIdle: true,
            preciseAlarm: true,
          );
      }
    }

    if (periodicity == 1) {
      if (startNamePill != now) {
        if ((startNamePill.day - now.day) % 2 != 0) {
          schedule = NotificationCalendar(
            weekday: now.weekday,
            day: now.day + 1,
            hour: hour,
            minute: minute,
            second: 0,
            millisecond: 0,
            repeats: true,
            timeZone: timeZone,
            allowWhileIdle: true,
            preciseAlarm: true,
          );
        }
      }
    }

    if (periodicity == 2) {
      if (startNamePill != now) {
        if ((startNamePill.day - now.day) % 2 == 0) {
          schedule = NotificationCalendar(
            weekday: now.weekday,
            day: now.day + 2,
            hour: hour,
            minute: minute,
            second: 0,
            millisecond: 0,
            repeats: true,
            timeZone: timeZone,
            allowWhileIdle: true,
            preciseAlarm: true,
          );
        }
      }
    }

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
      locked: true,
      payload: {'periodicity': periodicity.toString()},
    );

    final actionButtons = [
      NotificationActionButton(
        key: 'DONE',
        label: appLocalizations.good,
      ),
      NotificationActionButton(
        key: 'REMIND_LATER',
        label: appLocalizations.in_15_min,
      ),
      NotificationActionButton(
        key: 'Cancel',
        label: appLocalizations.cancel,
        actionType: ActionType.DismissAction
      ),
    ];

    await AwesomeNotifications().createNotification(
      content: content,
      actionButtons: actionButtons,
      schedule: schedule,
    );
  }



  static Future<void> onActionReceived(ReceivedAction receivedAction) async {
    int id = receivedAction.id!;
    String? title = receivedAction.title;
    String? body = receivedAction.body;
    String? bigPicture = receivedAction.bigPicture;
    // Map<String, String> periodic = receivedAction.payload as Map<String, String>;
    if (receivedAction.buttonKeyPressed == 'DONE') {
      // Обработка нажатия на первую кнопку уведомления с передачей полезной нагрузки
      navigatorKey.currentState!.pushNamed(MainNavigationRouteNames.coursesView,
          arguments: [title, body, bigPicture]);
    } else if (receivedAction.buttonKeyPressed == 'REMIND_LATER') {
      print('object');
      await NotificationService.createNotification(
          notificationId: id,
          name: title ?? '',
          description: body ?? '',
          photo: bigPicture!,
          hour: DateTime.now().hour,
          minute: DateTime.now().minute + 15,
          periodicity: 0,
          startNamePill: DateTime.now());
      SystemNavigator.pop();
      // Обработка нажатия на вторую кнопку уведомления с передачей полезной нагрузки
    } else {
      // Обработка нажатия на уведомление без нажатия на кнопки с передачей полезной нагрузки
      navigatorKey.currentState!.pushNamed(MainNavigationRouteNames.coursesView,
          arguments: [title, body, bigPicture]);
    }
  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
    // await AwesomeNotificationsPlatform.instance.resetGlobalBadge();
  }
}
