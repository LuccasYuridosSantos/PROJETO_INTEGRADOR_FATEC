// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../controllers/gas_station_controller.dart';

final appKey = GlobalKey();

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text('My Position'),
      ),
      body: ChangeNotifierProvider<GasStationController>(
        create: (context) => GasStationController(),
        child: Builder(builder: (context) {
          final place = context.watch<GasStationController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(0.0, 0.0),
              zoom: 18,
            ),
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            onMapCreated: place.onMapCreated,
            markers: place.markers,
          );
        }),
      ),
    );
  }
}
