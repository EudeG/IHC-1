import 'package:flutter/material.dart';
import '../models/estimacion_producto.dart';

class PantallaResultado extends StatelessWidget {
  final EstimacionProducto estimacion;

  const PantallaResultado({super.key, required this.estimacion});

  @override
  Widget build(BuildContext context) {
    final esRentable = estimacion.esRentable;
    final colorEstado = esRentable ? const Color(0xFF16A34A) : const Color(0xFFDC2626);
    final fondoEstado = esRentable ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado del Balance'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Tarjeta de estado principal
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: fondoEstado,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorEstado.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Icon(
                    esRentable ? Icons.check_circle_outline : Icons.warning_amber_rounded,
                    color: colorEstado,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    esRentable ? '¡Tu precio deja ganancia!' : 'Cuidado: Estás perdiendo dinero',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorEstado,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${estimacion.gananciaNetaUnitaria >= 0 ? '+' : ''}${estimacion.gananciaNetaUnitaria.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: colorEstado,
                    ),
                  ),
                  Text(
                    'Ganancia limpia por unidad vendida',
                    style: TextStyle(fontSize: 13, color: colorEstado.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tarjeta de desglose por unidad
            const Text(
              'Desglose por unidad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _FilaMetrica(
                      etiqueta: 'Costo real de producir 1 unidad',
                      valor: '${estimacion.costoUnitario.toStringAsFixed(2)}',
                      icono: Icons.pie_chart_outline,
                    ),
                    const Divider(height: 20),
                    _FilaMetrica(
                      etiqueta: 'Precio que vas a cobrar',
                      valor: '${estimacion.precioVentaTentativo.toStringAsFixed(2)}',
                      icono: Icons.sell_outlined,
                    ),
                    const Divider(height: 20),
                    _FilaMetrica(
                      etiqueta: 'Margen de ganancia',
                      valor: '${estimacion.margenGananciaPorcentaje.toStringAsFixed(1)}%',
                      icono: Icons.trending_up,
                      colorValor: colorEstado,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tarjeta de punto de equilibrio / meta
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.flag_outlined, color: Color(0xFFD97706)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Meta mínima de ventas',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Debes vender al menos ${estimacion.unidadesMinimasEquilibrio} de las ${estimacion.unidadesPorLote} unidades para recuperar la inversión total del lote (${estimacion.costoTotalLote.toStringAsFixed(2)}).',
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Botón para volver y ajustar
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Modificar costos o precio'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FilaMetrica extends StatelessWidget {
  final String etiqueta;
  final String valor;
  final IconData icono;
  final Color? colorValor;

  const _FilaMetrica({
    required this.etiqueta,
    required this.valor,
    required this.icono,
    this.colorValor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icono, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            etiqueta,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: colorValor ?? const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}