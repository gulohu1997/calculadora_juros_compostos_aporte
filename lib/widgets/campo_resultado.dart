import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CampoResultado extends StatelessWidget {
  final double valorFinalTotal;
  final String titulo;
  const CampoResultado({super.key, required this.titulo ,required this.valorFinalTotal});

  @override
  Widget build(BuildContext context) {

    final formatador = NumberFormat.simpleCurrency(locale: 'pt_BR');

    String valorFormatado = formatador.format(valorFinalTotal); 

    return Stack(      
      children: [
        Center(
          child: Container(
            height: 80,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2
                )
              ]
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text( titulo ,style: TextStyle(fontSize: 15),),
              Text(valorFormatado, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ],
    );
  }
}
