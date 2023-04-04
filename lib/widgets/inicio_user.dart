import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sag_usuario_v3/Models/PasajeModelo.dart';
import 'package:sag_usuario_v3/Services/service.dart';

class InicioUser extends StatefulWidget {
  const InicioUser({super.key});
  @override
  State<InicioUser> createState() => _InicioUserState();
}

class _InicioUserState extends State<InicioUser> {
  // Lista de datos
  List<Ruta> rutaList = [];
  // List<Parada> paradaList = [];

  String? rutas;
  // String? paradas;

  var estaCargando = true;

  populateDropDowns() async {
    PasajeModelo data = await getData();
    setState(() {
      rutaList = data.rutas;
      // paradaList = data.paradas;
      estaCargando = false;
    });
  }

  // Obtener ubicación
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
  }

  // Iniciar estado para opciones de lista
  @override
  void initState() {
    super.initState();
    populateDropDowns();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('images/SAG2.png'),
      const SizedBox(
        height: 20,
      ),
      const Text('¿En qué estación te encuentras?'),
      const SizedBox(
        height: 10,
      ),
      estaCargando ? const CircularProgressIndicator() : _inputRuta(),
      // _inputParada(),
      const SizedBox(
        height: 10,
      ),
      // Botón para obtener ubicación
      Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.5,
          child: ElevatedButton(
              onPressed: getLocation, child: const Text("Obtener ubicación")))
    ]);
  }

// Formato de selección de ruta
  Container _inputRuta() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: DropdownButton(
          hint: Text('Selecciona una ruta'),
          value: rutas,
          items: rutaList.map((e) {
            return DropdownMenuItem(
                value: e.id.toString(), child: Text(e.nombre));
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              rutas = newValue.toString();
            });
          },
        ));
  }

  // Formato de selección de parada
  // Container _inputParada() {
  //   return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 25),
  //       child: DropdownButton(
  //         hint: Text('Selecciona una parada'),
  //         value: paradas,
  //         items: paradaList.map((e) {
  //           return DropdownMenuItem(
  //               value: e.id.toString(), child: Text(e.nombre));
  //         }).toList(),
  //         onChanged: (newValue) {
  //           setState(() {
  //             paradas = newValue.toString();
  //           });
  //         },
  //       ));
  // }
}
