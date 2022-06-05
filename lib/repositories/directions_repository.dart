import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../.env.dart';
import '../model/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio = Dio();

  Future<Directions> getDirections({required LatLng origin, required LatLng destination}) async {
    Directions _directions = Directions(
        bounds: null,
        polylinePoints: null,
        totalDistance: null,
        totalDuration: null);

    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    if (response.statusCode == 200) {
      _directions = Directions.fromMap(response.data);
    }
    return _directions;
  }
}
