import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/screens/dashboard.dart';
import 'package:mobile_pcc/screens/dashboardMain.dart';
import 'package:mobile_pcc/screens/login.dart';

import 'package:mobile_pcc/screens/splashPage.dart';
import 'package:mobile_pcc/screens/temp.dart';

import 'Services/notifi_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}
