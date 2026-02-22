
import 'dart:math';

class CalculadorJuros {
  static double calcularMontante({
    required double capital,
    required double taxa,
    required double meses,
  }) {
    double resultado = capital * pow((1 + (taxa / 100)), meses);

    return resultado;
  }
}