import 'package:flutter/material.dart';
import 'screens/pantalla_inicio.dart';
import 'theme/tema_app.dart';

void main() {
  runApp(const MiAppRentabilidad());
}

class MiAppRentabilidad extends StatelessWidget {
  const MiAppRentabilidad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculador de Rentabilidad',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.temaClaro,
      home: const PantallaInicio(),
    );
  }
}