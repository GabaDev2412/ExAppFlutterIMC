import 'package:flutter/material.dart';
import 'package:myapp/utils/calcular_imc.dart';
import 'package:myapp/widgets/form_imc.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  double _imc = 0.0;

  void _calculateIMC() {
    final altura = double.tryParse(_alturaController.text) ?? 0.0;
    final peso = double.tryParse(_pesoController.text) ?? 0.0;
    setState(() {
      _imc = calcularIMC(altura, peso);
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
                'Análise IMC: ${analiseIMC(_imc)}',style: const TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}
