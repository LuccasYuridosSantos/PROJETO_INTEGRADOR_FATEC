// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:projeto_integrador_fatec/repositories/gas_station_repository.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<GasStationRepository>(
    create: (_) => GasStationRepository(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postos Locais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
