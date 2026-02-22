import 'package:flutter/material.dart';

class CampoDeValor extends StatelessWidget {
  final String titulo;
  final String? iconeTexto;
  final  TextEditingController controller;
  
  const CampoDeValor({super.key, required this.titulo, this.iconeTexto, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: TextStyle(fontWeight: FontWeight.bold) ,),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              prefixIcon: iconeTexto != null? Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  iconeTexto!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ): null,
            ),
          ),
        ],
      ),
    );
  }
}
