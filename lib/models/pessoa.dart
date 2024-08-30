//lib/models/pessoa.dart
class Pessoa {
  final String nome;
  final double altura;
  final double peso;
  double imc = 0.0;
  String textImcAnalyze = '';

  Pessoa(this.nome, this.altura, this.peso, [double? imc, String? textImcAnalyze]);

  calcularIMC(double altura, double peso) {}
}
