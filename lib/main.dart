import 'package:doctor_app/app/app/app.dart';
import 'package:doctor_app/app/app/bloc_observer.dart';
import 'package:doctor_app/data/local/local_database.dart';
import 'package:doctor_app/data/models/notification/notification_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print(
      "Handling a background message-------------------------------------------------: ${message.data}");
  List a = [];
  var nima = message.data.values.map((e) => e);
  debugPrint('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ----------- ${nima.toString()}');
  await LocalDatabase.addNotification(
    NotificationModel(
      title: nima.last,
      date: DateTime.now().toString(),
      body: nima.first,
    ),
  );
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic("my_news");
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //HttpOverrides.global = MyHttpOverrides();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      //fallbackLocale: const Locale('uz', 'UZ'),
      startLocale:  const Locale('en','EN'),
      path: "assets/translations",
      //saveLocale: true,
      child: App(),
    ),
  );
}
