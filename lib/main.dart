// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:projeto_integrador_fatec/repositories/gas_station_repository.dart';
import 'package:projeto_integrador_fatec/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'widgets/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider<GasStationRepository>(
            create: (_) => GasStationRepository())
      ],
      child: MyApp(),
    ),
  );
}
