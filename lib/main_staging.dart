import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/app.dart';
import 'package:travel_cost_log/app/core/config.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/firebase_options.dart';

Future<void> main() async {
  Config.appFlavor = Flavor.staging;
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
