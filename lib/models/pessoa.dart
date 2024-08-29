class Pessoa {
  final String _nome;
  final double _altura;
  final double _peso;

  Pessoa(this._nome, this._altura, this._peso);

  double get altura => _altura;
  double get peso => _peso;
  String get nome => _nome;
}
