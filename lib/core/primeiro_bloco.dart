import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juros_compostos/core/app_colors.dart';
import 'package:juros_compostos/widgets/campo_de_valor.dart';
import 'package:juros_compostos/widgets/campo_resultado.dart';

class PrimeiroBloco extends StatefulWidget {
  const PrimeiroBloco({super.key});

  @override
  State<PrimeiroBloco> createState() => _PrimeiroBlocoState();
}

class _PrimeiroBlocoState extends State<PrimeiroBloco> {
  final _ctrlInicial = TextEditingController();
  final _ctrlMensal = TextEditingController();
  final _ctrlTaxa = TextEditingController();
  final _ctrlMeses = TextEditingController();

  double _totalFinal = 0;
  double _totalInvestido = 0;
  double _totalJuros = 0;

  void _executarCalculos() {
    double capital =
        double.tryParse(_ctrlInicial.text.replaceAll(',', '.')) ?? 0;
    double aporte = double.tryParse(_ctrlMensal.text.replaceAll(',', '.')) ?? 0;

    double taxaInput =
        double.tryParse(_ctrlTaxa.text.replaceAll(',', '.')) ?? 0;
    double i = taxaInput / 100;

    int tempo = int.tryParse(_ctrlMeses.text) ?? 0;

    if (tempo > 0) {
      double montanteFinal;

      if (i == 0) {
        montanteFinal = capital + (aporte * tempo);
      } else {
        montanteFinal =
            (capital * pow(1 + i, tempo)) +
            (aporte * (pow(1 + i, tempo) - 1) / i);
      }

      setState(() {
        _totalFinal = montanteFinal;
        _totalInvestido = capital + (aporte * tempo);
        _totalJuros = _totalFinal - _totalInvestido;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35),
        CampoDeValor(
          titulo: 'Valor inicial',
          iconeTexto: 'R\$',
          controller: _ctrlInicial,
        ),
        SizedBox(height: 35),
        CampoDeValor(
          titulo: 'Valor mensal',
          iconeTexto: 'R\$',
          controller: _ctrlMensal,
        ),
        SizedBox(height: 35),
        CampoDeValor(
          titulo: 'Taxa de juros',
          iconeTexto: '%',
          controller: _ctrlTaxa,
        ),
        SizedBox(height: 35),
        CampoDeValor(titulo: 'Período em mês', controller: _ctrlMeses),
        SizedBox(height: 30),

        ElevatedButton(
          onPressed: _executarCalculos,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.CorAppBar,
            foregroundColor: Colors.white,
          ),
          child: const Text('Calcular'),
        ),

        Divider(height: 100, thickness: 4, indent: 35, endIndent: 35),
        CampoResultado(
          titulo: 'Valor final total',
          valorFinalTotal: _totalFinal,
        ),
        SizedBox(height: 35),
        CampoResultado(
          titulo: 'Valor total investido',
          valorFinalTotal: _totalInvestido,
        ),
        SizedBox(height: 30),
        CampoResultado(titulo: 'Total em juros', valorFinalTotal: _totalJuros),
        Divider(height: 100, thickness: 4, indent: 35, endIndent: 35),
        SizedBox(height: 35),
      ],
    );
  }
}
