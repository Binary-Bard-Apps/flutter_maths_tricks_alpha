import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_maths_tricks/app/app_routes.dart';
import 'package:flutter_maths_tricks/app/key_util.dart';
import 'package:flutter_maths_tricks/data/hive_data.dart';
import 'package:flutter_maths_tricks/theme/app_theme.dart';
import 'package:flutter_maths_tricks/theme/controller/theme_controller.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Login ///
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String selectedNotificationPayload = "";

ThemeController themeController = Get.put(ThemeController());
String defTimeZoneName = "America/Detroit";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification:
              (int? id, String? title, String? body, String? payload) async {
            didReceiveLocalNotificationSubject.add(ReceivedNotification(
                id: id!, title: title!, body: body!, payload: payload!));
          });
  const MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false);
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    print("selectnoti==terue");
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }

    selectedNotificationPayload = payload!;
    selectNotificationSubject.add(payload);
  });

  if (!kIsWeb) {
    var appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  MobileAds.instance.initialize();
  HiveData.registerAdapter();
  HiveData.openAllBox();

  // runApp(MyApp());
  startmain();
}

//////
void startmain() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/s-icon.jpg"), fit: BoxFit.fitWidth),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    // debugPrint('Hello');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isAlreadyAuthenticated = prefs.getBool('auth');
    debugPrint(
        'The initial value of isAlreadyAuthenticated $isAlreadyAuthenticated');
    isAlreadyAuthenticated ??= false;
    // var status = prefs.getBool('isLoggedIn') ?? false;
    // debugPrint('Hello');
    // debugPrint('Hello');
    debugPrint(
        'The initial value of isAlreadyAuthenticated $isAlreadyAuthenticated');

    if (isAlreadyAuthenticated) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MathApp()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }
}
////

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();

  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

  // final timeZone = TimeZone();
  // String timeZoneName = await timeZone.getTimeZoneName();
  print("getname===$timeZoneName");
  try {
    tz.Location getlocal =
        tz.getLocation(timeZoneName.replaceAll("Calcutta", "Kolkata"));
    tz.setLocalLocation(getlocal);
  } catch (e) {
    print(e);
    tz.Location getlocal = tz.getLocation(defTimeZoneName);
    tz.setLocalLocation(getlocal);
    print("getnamerr=${e.toString()}");
  }
  // tz.setLocalLocation(tz.getLocation(timeZoneName));
  // tz.setLocalLocation(TimeZone.getDefault().id);
}

void printHello() {
  print("hello----world! isolate='");

  FlutterLocalNotificationsPlugin flip = new FlutterLocalNotificationsPlugin();
  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var ios = new IOSInitializationSettings();
  var settings = new InitializationSettings(android: android, iOS: ios);
  flip.initialize(settings);
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

class MathApp extends StatelessWidget {
  MathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'Math Trick',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.themeMode,
          routes: appRoutes,
          initialRoute: KeyUtil.splash,
        );
      },
      init: ThemeController(),
    );
  }
}
