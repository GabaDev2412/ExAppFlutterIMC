// lib/pages/imc_page.dart
import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa.dart';
import 'package:myapp/widgets/form_imc.dart';
import 'package:myapp/utils/calcular_imc.dart';

class ImcPage extends StatefulWidget {
  final Function(Pessoa) onIMCUpdated;

  const ImcPage({super.key, required this.onIMCUpdated});

  @override
  // ignore: library_private_types_in_public_api
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  double _imc = 0.0;
  String _imcAnalysis = '';

  void _calculateIMC() {
    final altura = double.tryParse(_alturaController.text) ?? 0.0;
    final peso = double.tryParse(_pesoController.text) ?? 0.0;
    setState(() {
      _imc = calcularIMC(altura, peso);
      _imcAnalysis = analiseIMC(_imc);
      final pessoa = Pessoa("Pessoa ${_imc.toStringAsFixed(2)}", altura, peso, _imc, _imcAnalysis);
      widget.onIMCUpdated(pessoa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormImc(
                title: "Informe a altura",
                hintText: "Digite a altura em metros",
                controller: _alturaController,
              ),
              FormImc(
                title: "Informe o peso",
                hintText: "Digite o peso em kg",
                controller: _pesoController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateIMC,
                child: const Text('Calcular IMC'),
              ),
              const SizedBox(height: 20),
              Text(
                'IMC: ${_imc.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Análise IMC: $_imcAnalysis',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}