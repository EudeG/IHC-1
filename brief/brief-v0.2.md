# Brief v0.2 — Calculadora de rentabilidad para microemprendimientos

---

## 1. Problema revisado
**¿Qué dificultad se mantiene después de investigar?**

Se mantiene la dificultad central: las personas sin formación financiera no logran traducir su idea de negocio en números concretos (cuánto invertir, cuánto ganar, si conviene o no). Pero la investigación agrega un matiz importante: el problema no es solo "no saber calcular", sino que ya existen hábitos que **reemplazan** el cálculo — comparar precios por intuición, preguntar a conocidos, o dejarse guiar por reacciones en redes sociales. La app no llena un vacío total, compite con estos métodos informales.

## 2. Usuario y contexto
**¿Quién, dónde, cuándo y con qué limitaciones?**

- **Quién:** persona con una idea de microemprendimiento, o que ya vende de forma informal (ej. repostería, artesanías, ropa), sin formación en finanzas ni contabilidad.
- **Dónde:** en su celular, en Bolivia (contexto urbano); probablemente un dispositivo Android de gama media/baja.
- **Cuándo:** en momentos dispersos y sin tiempo dedicado (fines de semana, después del trabajo), en la etapa previa a lanzar o al comparar varias ideas entre sí.
- **Limitaciones:** sin vocabulario financiero, poca memoria/espacio en el celular (la app no puede ser pesada), poco tiempo disponible si el emprendimiento es un ingreso adicional, e inseguridad frente a términos técnicos.

## 3. Evidencia
**6 observaciones o frases que sostienen el problema**


1. *"Sé que algo gano porque vendo, pero no lo he sacado en números."* — no distingue ingreso bruto de ganancia real.
2. Mezclan la plata del negocio con la personal — "todo va a la misma billetera", lo que impide calcular un margen real.
3. Usan los likes o pedidos en redes sociales como "termómetro" de que el negocio va bien, en lugar de calcular rentabilidad.


## 4. Insight
**¿Qué aprendimos que no sabíamos al crear el Brief v0.1?**

- El usuario no llega en blanco: ya tiene métodos alternativos (comparación social, Excel improvisado, consejo de conocidos) que compiten con la app.
- El miedo al juicio social o la vergüenza puede pesar más que cualquier número al momento de abandonar una idea — un factor emocional que el brief original no contemplaba.
- Mezclar plata personal y del negocio es una barrera *previa* al cálculo: antes de hablar de margen, muchos ni siquiera separan sus fondos.

## 5. Hipótesis revisada
**¿Qué creemos ahora y qué falta comprobar?**

**Creemos ahora** que el usuario necesita, más que fórmulas financieras, una herramienta que traduzca su lenguaje cotidiano ("cuánto gasto", "cuánto cobro") a conceptos simples, mostrando el resultado sin jerga técnica.

**Falta comprobar** si, al ver un número concreto (ej. "pierdes X por unidad"), el usuario realmente cambia su decisión, o si el criterio social/emocional sigue pesando más que el dato financiero.

## 6. Alcance
**Qué entra en la primera versión y qué queda fuera**

| Entra | Queda fuera |
|---|---|
| Costo unitario | Comparación entre varias ideas a la vez |
| Margen | Impuestos |
| Inversión inicial | Facturación / contabilidad completa |
| Punto de equilibrio | Historial o seguimiento en el tiempo |

## 7. Flujo principal
**La tarea de inicio a fin en 7 pasos**

1. El usuario abre la app y elige "nueva idea/producto".
2. Ingresa qué vende (nombre del producto).
3. Ingresa el costo de producir una unidad (materiales, insumos).
4. Ingresa el precio al que piensa vender cada unidad.
5. Ingresa la inversión inicial que necesita (equipo, materia prima, etc.).
6. La app calcula automáticamente costo unitario, margen y punto de equilibrio.
7. El usuario ve el resultado en lenguaje simple (ej. "necesitas vender X unidades para recuperar tu inversión") y decide si ajusta sus datos o continúa.

## 8. Criterios de éxito
**3 señales observables para saber si funciona**

1. El usuario completa el flujo (los 4 datos básicos) sin abandonar ni pedir ayuda externa.
2. El usuario puede explicar con sus propias palabras qué significa el resultado (margen, punto de equilibrio) sin usar términos técnicos.
3. El usuario ajusta al menos un dato de su idea (precio o costo) después de ver el resultado, mostrando que el número influyó en su decisión.

## 9. Primer requerimiento
**Una capacidad concreta para diseñar o implementar**

Formulario de ingreso de datos básicos de un producto (nombre, costo unitario, precio de venta, inversión inicial) que calcule y muestre de inmediato, en pantalla y en lenguaje simple, el costo unitario, el margen y el punto de equilibrio.

## 10. Preguntas abiertas
**Qué todavía no podemos afirmar**

- Si el usuario confiará más en un número calculado por la app que en su intuición o comparación social al fijar precio.
- Cuántos datos está dispuesto a ingresar antes de abandonar el formulario.
- Si el "tiempo de recuperación de inversión" (mencionado en la idea inicial) es realmente necesario, o si el punto de equilibrio ya es suficiente para decidir.
- Si mostrar un solo producto a la vez limita demasiado a usuarios que ya están comparando varias ideas en su cabeza.