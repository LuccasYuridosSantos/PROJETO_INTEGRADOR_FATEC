// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_integrador_fatec/pages/gas_station_page.dart';
import 'package:projeto_integrador_fatec/repositories/gas_station_repository.dart';

import '../widgets/gas_station_details.dart';

class GasStationController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  // GasStationController() {
  //   getPosition();
  // }

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosition();
    loadGasStation();
  }

  loadGasStation() {
    final gasStation = GasStationRepository().gasStation;
    gasStation.forEach((element) async {
      markers.add(
        Marker(
          markerId: MarkerId(element.name),
          position: LatLng(element.latitude, element.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(120.0, 120.0),
            ),
            'images/fuel.png',
          ),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context)=> GasStationDetails(gasStation: element),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosition() async {
    try {
      Position position = await _determinePosition();

      lat = position.latitude;
      long = position.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
