import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

final notifications = FlutterLocalNotificationsPlugin();

//앱 로드시 실행할 기본설정
initNotification() async {
  var androidSetting = const AndroidInitializationSettings('@mipmap/ic_launcher');

  // 안드로이드 13 이상 권한 요청
  if (Platform.isAndroid) {
    notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // iOS 설정
  var iosSetting = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting
  );

  await notifications.initialize(
      initializationSettings,
  );
}