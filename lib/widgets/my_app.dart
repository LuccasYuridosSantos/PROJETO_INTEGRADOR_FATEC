
// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:projeto_integrador_fatec/pages/home_page.dart';
import 'package:projeto_integrador_fatec/pages/login_page.dart';
import 'package:projeto_integrador_fatec/widgets/auth_check.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postos Locais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AuthCheck(),
    );
  }
}