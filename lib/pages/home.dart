import 'package:flutter/material.dart';
import 'package:juros_compostos/core/app_colors.dart';
import 'package:juros_compostos/core/primeiro_bloco.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CorFundo,
      appBar: AppBar(
        backgroundColor: AppColors.CorAppBar,
        title: Center(
          child: Text(
            'Juros Compostos',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            PrimeiroBloco()
          ],
        ),
      )
      
    );
  }
}
