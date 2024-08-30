// lib/pages/build_page.dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/imc_page.dart';
import 'package:myapp/pages/list_imc_page.dart';
import 'package:myapp/models/pessoa.dart';

Widget buildPage(int index, List<Pessoa> pessoas, String imc, String textImcAnalyze) {
  switch (index) {
    case 0:
      return ImcPage(
        onIMCUpdated: (pessoa) {
          pessoas.add(pessoa);
        },
      );
    case 1:
      return ListImcPage(
        imcsPessoas: pessoas,
        imc: imc,
        textImcAnalyze: textImcAnalyze,
      );
    default:
      return const Center(child: Text('Welcome to the IMC Calculator!'));
  }
}