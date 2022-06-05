// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_integrador_fatec/model/directions_model.dart';

import 'package:projeto_integrador_fatec/model/gas_station.dart';
import 'package:intl/intl.dart';
import 'package:projeto_integrador_fatec/pages/details_gas_station.dart';

class GasStationDetails extends StatelessWidget {
  GasStation gasStation;
  Directions? directions;
  LatLng latLng;
  NumberFormat real =
      NumberFormat.currency(locale: 'pt_BR', name: 'R\$', decimalDigits: 3);

  GasStationDetails(
      {Key? key,
      required this.gasStation,
      required this.latLng,
      Directions? directions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dynamicDetails(context);
  }

  dynamicDetails(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Wrap(
            children: [
              Image.network(
                gasStation.photo,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 24,
                ),
                child: Text(
                  gasStation.name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  left: 24,
                ),
                child: Text(
                  gasStation.address,
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
                            gasStation.gasolina.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            real.format(gasStation.gasolina.price),
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
                            gasStation.etanol.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            real.format(gasStation.etanol.price),
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
              Container(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () =>
                      showDetailsGasStation(context, latLng, gasStation),
                  elevation: 12,
                  hoverColor: Colors.orangeAccent,
                  child: Icon(Icons.description),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showDetailsGasStation(
      BuildContext context, LatLng latLng, GasStation gasStation) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) =>
              DetailsGasStationPage(origin: latLng, gasStation: gasStation)),
    );
  }
}
