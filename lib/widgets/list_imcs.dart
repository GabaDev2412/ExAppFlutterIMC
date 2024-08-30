// lib/widgets/list_imcs.dart
import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa.dart';

class ListIMCs extends StatelessWidget {
  final List<Pessoa> imcsPessoas;
  final String imc;
  final String textImcAnalyze;

  const ListIMCs(
      {super.key, required this.imcsPessoas, required this.textImcAnalyze, required this.imc});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Ensure the ListView doesn't take infinite height
      itemCount: imcsPessoas.length,
      itemBuilder: (context, index) {
        final pessoa = imcsPessoas[index];
        return Card(
          child: ListTile(
            title: Text(pessoa.nome),
            subtitle: Text(
                '$textImcAnalyze, Altura: ${pessoa.altura}, Peso: ${pessoa.peso}'),
          ),
        );
      },
    );
  }
}