import 'package:flutter/material.dart';
import 'pantalla_ingreso_datos.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),

              // Ícono distintivo central
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFDE68A),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.storefront_outlined,
                  size: 48,
                  color: Color(0xFFD97706),
                ),
              ),
              const SizedBox(height: 28),

              // Título y propuesta de valor
              const Text(
                'Calcula la ganancia\nreal de tus postres',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Descubre cuánto te cuesta preparar cada tanda y fija precios con total seguridad, sin cálculos complicados.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // Puntos clave de valor para el usuario
              _ItemBeneficio(
                icono: Icons.checklist_rounded,
                texto: 'Suma ingredientes, empaques y extras.',
              ),
              const SizedBox(height: 12),
              _ItemBeneficio(
                icono: Icons.visibility_outlined,
                texto: 'Incluye costos ocultos como el gas o la luz.',
              ),
              const SizedBox(height: 12),
              _ItemBeneficio(
                icono: Icons.savings_outlined,
                texto: 'Conoce tu ganancia limpia por cada unidad.',
              ),

              const Spacer(),

              // Botón de acción principal
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Comenzar nuevo cálculo'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaIngresoDatos(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemBeneficio extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _ItemBeneficio({
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icono, size: 18, color: const Color(0xFFD97706)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF334155),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}