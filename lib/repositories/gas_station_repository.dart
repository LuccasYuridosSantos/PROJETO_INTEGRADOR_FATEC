import 'package:flutter/material.dart';
import 'package:projeto_integrador_fatec/model/combustivel.dart';

import '../model/gas_station.dart';

class GasStationRepository extends ChangeNotifier {
  final List<GasStation> _gasStation = [
    GasStation(
      name: 'Posto GT - Rede Rodoil',
      address: 'R. João Negrão, 1072 - Rebouças - Centro, Curitiba - PR',
      photo:
          'https://lh5.googleusercontent.com/p/AF1QipP_xnSi5-sp9slSuMpSx-JlmvwvHGL1VJ_JcOGX=w408-h306-k-no',
      latitude: -25.4361979,
      longitude: -49.2624613,
      etanol: Combustivel(name: 'Etanol', price: 5.499),
      gasolina: Combustivel(name: 'Gasolina', price: 6.799),
    ),
    GasStation(
      name: 'Auto Posto Rodoviária',
      address: 'Av. Presidente Affonso Camargo 10 - Rebouças, Curitiba - PR',
      photo:
          'https://lh5.googleusercontent.com/p/AF1QipPnfQSsnvt6-VAxF-fUQ0onQCeRktJptOvSL_9F=w408-h306-k-no',
      latitude: -25.435538,
      longitude: -49.2623809,
      etanol: Combustivel(name: 'Gasolina', price: 6.999),
      gasolina: Combustivel(name: 'Etanol', price: 4.999),
    ),
    GasStation(
      name: 'Auto Posto Nilo Cairo',
      address: 'R. Tibagi, 652 - Centro, Curitiba - PR',
      photo:
          'https://lh5.googleusercontent.com/p/AF1QipOB2w7C9Q_NTblNRhcxJtN3-s4_gSjHI1rs5cSM=w408-h544-k-no',
      latitude: -25.435260,
      longitude: -49.2620769,
      etanol: Combustivel(name: 'Gasolina', price: 6.999),
      gasolina: Combustivel(name: 'Etanol', price: 4.999),
    ),
  ];

  List<GasStation> get gasStation => _gasStation;
}
