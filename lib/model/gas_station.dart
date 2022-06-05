import 'package:projeto_integrador_fatec/model/combustivel.dart';
import 'package:projeto_integrador_fatec/model/directions_model.dart';

class GasStation {
  String name;
  String address;
  String photo;
  double latitude;
  double longitude;
  Combustivel etanol;
  Combustivel gasolina;
  Directions? directions;

  GasStation(
      {required this.name,
      required this.address,
      required this.photo,
      required this.latitude,
      required this.longitude,
      required this.etanol,
      required this.gasolina,
      Directions? directions});
}
