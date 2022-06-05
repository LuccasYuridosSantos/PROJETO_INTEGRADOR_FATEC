// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:projeto_integrador_fatec/model/directions_model.dart';
import 'package:projeto_integrador_fatec/model/gas_station.dart';
import 'package:projeto_integrador_fatec/repositories/directions_repository.dart';

class DetailsGasStationPage extends StatefulWidget {
  LatLng origin;
  GasStation gasStation;

  DetailsGasStationPage(
      {Key? key, required this.origin, required this.gasStation})
      : super(key: key);

  @override
  State<DetailsGasStationPage> createState() => _DetailsGasStationPageState();
}

class _DetailsGasStationPageState extends State<DetailsGasStationPage> {
  NumberFormat real =
      NumberFormat.currency(locale: 'pt_BR', name: 'R\$', decimalDigits: 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gasStation.name),
      ),
      body: Column(children: <Widget>[
        Wrap(
          children: [
            Image.network(
              widget.gasStation.photo,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 30,
                left: 24,
              ),
              child: Text(
                widget.gasStation.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 189, 189, 189),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(4, 4)),
                      ],
                      color: Color.fromARGB(255, 253, 241, 79),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.gasStation.gasolina.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          real.format(widget.gasStation.gasolina.price),
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 189, 189, 189),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(4, 4)),
                      ],
                      color: Color.fromARGB(255, 123, 235, 243),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.gasStation.etanol.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          real.format(widget.gasStation.etanol.price),
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<Directions?>(
                future: DirectionsRepository().getDirections(
                    origin: widget.origin,
                    destination: LatLng(widget.gasStation.latitude,
                        widget.gasStation.longitude)),
                builder: (context, snapshort) {
                  if (snapshort.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshort.hasData) {
                    Directions? _directions = snapshort.data;
                    if (_directions != null) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 24,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 189, 189, 189),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(4, 4)),
                                  ],
                                  color: Color.fromARGB(255, 123, 235, 243),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Distância:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_directions.totalDistance}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 189, 189, 189),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(4, 4)),
                                  ],
                                  color: Color.fromARGB(255, 123, 235, 243),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Tempo:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_directions.totalDuration}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return Text('Show Directions');
                })
          ],
        ),
      ]),
    );
  }
}
