// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/gas_station_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Position'),
      ),
      body: ChangeNotifierProvider<GasStationController>(
        create: (context) => GasStationController(),
        child: Builder(
          builder: (context) {
            final place = context.watch<GasStationController>();
            String message = place.erro == ''
                ? 'Latidude: ${place.lat} | Longitude ${place.long}'
                : place.erro;

            return Center(child: Text(message));
          },
        ),
      ),
    );
  }
}
