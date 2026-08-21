class EstimacionProducto {
  String nombreProducto;
  int unidadesPorLote; // Cantidad producida por tanda (ej. 12 cupcakes)
  double costoIngredientes; // Harina, azúcar, huevos, etc.
  double costoEmpaques; // Cajas, lazos, capacillos, bolsas
  double costoServicios; // Gas, electricidad estimada, traslados
  double precioVentaTentativo; // Precio unitario que se piensa cobrar

  EstimacionProducto({
    this.nombreProducto = '',
    this.unidadesPorLote = 1,
    this.costoIngredientes = 0.0,
    this.costoEmpaques = 0.0,
    this.costoServicios = 0.0,
    this.precioVentaTentativo = 0.0,
  });

  // 1. Costo total para producir todo el lote
  double get costoTotalLote =>
      costoIngredientes + costoEmpaques + costoServicios;

  // 2. Costo real de producir una sola unidad
  double get costoUnitario =>
      unidadesPorLote > 0 ? (costoTotalLote / unidadesPorLote) : 0.0;

  // 3. Ganancia limpia por cada unidad vendida
  double get gananciaNetaUnitaria => precioVentaTentativo - costoUnitario;

  // 4. Margen de ganancia porcentual
  double get margenGananciaPorcentaje => precioVentaTentativo > 0
      ? (gananciaNetaUnitaria / precioVentaTentativo) * 100
      : 0.0;

  // 5. Unidades mínimas a vender para no perder dinero (Punto de equilibrio)
  int get unidadesMinimasEquilibrio => precioVentaTentativo > 0
      ? (costoTotalLote / precioVentaTentativo).ceil()
      : 0;

  // Indica si el negocio es rentable con el precio actual
  bool get esRentable => gananciaNetaUnitaria > 0;
}