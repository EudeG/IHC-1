import 'package:flutter/material.dart';
import '../models/estimacion_producto.dart';
import 'pantalla_resultado.dart';

class PantallaIngresoDatos extends StatefulWidget {
  const PantallaIngresoDatos({super.key});

  @override
  State<PantallaIngresoDatos> createState() => _PantallaIngresoDatosState();
}

class _PantallaIngresoDatosState extends State<PantallaIngresoDatos> {
  final _formularioKey = GlobalKey<FormState>();
  final _estimacion = EstimacionProducto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcula tu Ganancia'),
      ),
      body: SafeArea(
        child: Form(
          key: _formularioKey,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              // Sección 1: Tu producto
              _construirEncabezadoSeccion(
                icono: Icons.bakery_dining_outlined,
                titulo: '1. ¿Qué vas a preparar?',
                subtitulo: 'Cuéntanos la idea de tu producto o tanda.',
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  hintText: 'Ej. Torta tres leches o 12 Cupcakes',
                  prefixIcon: Icon(Icons.cake_outlined),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Por favor ingresa un nombre para el producto';
                  }
                  return null;
                },
                onSaved: (valor) => _estimacion.nombreProducto = valor!.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '¿Cuántas unidades salen por tanda?',
                  hintText: 'Ej. 12',
                  prefixIcon: Icon(Icons.format_list_numbered),
                ),
                validator: (valor) {
                  final numero = int.tryParse(valor ?? '');
                  if (numero == null || numero <= 0) {
                    return 'Ingresa una cantidad válida mayor a 0';
                  }
                  return null;
                },
                onSaved: (valor) =>
                    _estimacion.unidadesPorLote = int.parse(valor!),
              ),
              const SizedBox(height: 28),

              // Sección 2: Gastos directos del lote
              _construirEncabezadoSeccion(
                icono: Icons.shopping_bag_outlined,
                titulo: '2. Gastos de la tanda',
                subtitulo: 'Suma lo que gastas para preparar esa cantidad.',
              ),
              const SizedBox(height: 12),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Total en ingredientes (Bs / \$)',
                  hintText: 'Harina, huevos, crema, manjar...',
                  prefixIcon: Icon(Icons.receipt_long_outlined),
                ),
                validator: (valor) {
                  final numero = double.tryParse(valor ?? '');
                  if (numero == null || numero < 0) {
                    return 'Ingresa un costo válido';
                  }
                  return null;
                },
                onSaved: (valor) =>
                    _estimacion.costoIngredientes = double.parse(valor!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Empaques y presentación (Bs / \$)',
                  hintText: 'Cajas, lazos, blondas, bolsas...',
                  prefixIcon: Icon(Icons.inventory_2_outlined),
                ),
                onSaved: (valor) =>
                    _estimacion.costoEmpaques = double.tryParse(valor ?? '') ?? 0.0,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Gas, luz y extras estimados (Bs / \$)',
                  hintText: 'Un aproximado por tanda horneada',
                  prefixIcon: Icon(Icons.local_fire_department_outlined),
                ),
                onSaved: (valor) =>
                    _estimacion.costoServicios = double.tryParse(valor ?? '') ?? 0.0,
              ),
              const SizedBox(height: 28),

              // Sección 3: Precio de venta
              _construirEncabezadoSeccion(
                icono: Icons.sell_outlined,
                titulo: '3. Precio de venta pensado',
                subtitulo: '¿Cuánto tenías pensado cobrar por unidad?',
              ),
              const SizedBox(height: 12),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Precio por unidad (Bs / \$)',
                  hintText: 'Ej. 15.00',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (valor) {
                  final numero = double.tryParse(valor ?? '');
                  if (numero == null || numero <= 0) {
                    return 'Ingresa un precio válido mayor a 0';
                  }
                  return null;
                },
                onSaved: (valor) =>
                    _estimacion.precioVentaTentativo = double.parse(valor!),
              ),
              const SizedBox(height: 36),

              // Botón de cálculo
              FilledButton.icon(
                icon: const Icon(Icons.query_stats_rounded),
                label: const Text('Verificar y Calcular Balance'),
                onPressed: _procesarFormulario,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirEncabezadoSeccion({
    required IconData icono,
    required String titulo,
    required String subtitulo,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icono, size: 22, color: const Color(0xFFD97706)),
            const SizedBox(width: 8),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitulo,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  void _procesarFormulario() {
    if (_formularioKey.currentState!.validate()) {
      _formularioKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaResultado(estimacion: _estimacion),
        ),
      );
    }
  }
}