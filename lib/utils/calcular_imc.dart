double calcularIMC(double altura, double peso) {
  return peso / (altura * altura);
}

String analiseIMC(double imc) {
  if (imc < 18.5) {
    return "Abaixo do peso";
  } else if (imc >= 18.5 && imc < 24.9) {
    return "Peso normal";
  } else if (imc >= 25.0 && imc < 29.9) {
    return "Sobrepeso";
  } else if (imc >= 30.0) {
    return "Obesidade";
  } else {
    return "Valor inválido";
  }
}