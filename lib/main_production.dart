import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voyage_vault/app/app.dart';
import 'package:voyage_vault/app/core/config.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/firebase_options.dart';

Future<void> main() async {
  Config.appFlavor = Flavor.production;
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
