import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:femalefellows/data/constants.dart';
import 'package:femalefellows/provider/firebase/cloud_functions.dart';

class Messaging {
  factory Messaging() {
    return _singleton;
  }

  Messaging._internal();

  static final Messaging _singleton = Messaging._internal();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final Stream<RemoteMessage> onMessage = FirebaseMessaging.onMessage;

  final Stream<RemoteMessage> onMessageOpenedApp = FirebaseMessaging.onMessageOpenedApp;

  bool isFlutterLocalNotificationsInitialized = false;

  final CloudFunctions cloudfunctions = CloudFunctions();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  Future<NotificationSettings> getNotificationSettings() async {
    final NotificationSettings settings = await firebaseMessaging.getNotificationSettings();
    return settings;
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      androidNotificationChannelId, // id
      androidNotificationChannelName, // title
      description: androidNotificationChannelDescription, // description
      importance: Importance.max,
    );


    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> _setFirstStart() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('firstStart', false).then((bool success) {
      //BlocProvider.of<FirstStartBloc>(_context).add(IsNotFirstStartEvent());
    });
  }

  Future<void> requestPermission() async {
    firebaseMessaging.requestPermission(
      announcement: true,
      criticalAlert: true,
      sound: false,
    );
    _setFirstStart();
    _activatePushNotification();
  }

  Future<void> _activatePushNotification() async {
    final SharedPreferences prefs = await _prefs;
    final bool firstStart = prefs.getBool('firstStart') ?? true;

    if (firstStart) return;

    final String? token = await firebaseMessaging.getToken();

    if (token == null) return;

    try {
      cloudfunctions.firebaseFunctions.httpsCallable('sendFcmToken').call(<String, dynamic>{
        'token': token,
      }).then((onValue) => print((onValue.data as Map<String, dynamic>)['result']));
    } catch (_) {}
  }
}