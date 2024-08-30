// lib/pages/list_imc_page.dart
import 'package:flutter/material.dart';
import 'package:myapp/widgets/list_imcs.dart';
import 'package:myapp/models/pessoa.dart';

class ListImcPage extends StatelessWidget {
  final List<Pessoa> imcsPessoas;
  final String imc;
  final String textImcAnalyze;

  const ListImcPage(
      {super.key, required this.imcsPessoas, required this.textImcAnalyze, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Lista de IMC's"),
            ListIMCs(imcsPessoas: imcsPessoas, textImcAnalyze: textImcAnalyze, imc: imc),
          ],
        ),
      ),
    );
  }
}