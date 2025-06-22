import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frizter/app/di/di_container.dart';
import 'package:frizter/app/frizter_app.dart';
import 'package:frizter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); //be sure to add firebase configuration
  await setupConfiguration();

  runApp(const FrizterApp());
}
