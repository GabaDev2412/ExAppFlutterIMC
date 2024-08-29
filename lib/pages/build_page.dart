import 'package:flutter/material.dart';
import 'package:myapp/pages/imc_page.dart';

Widget buildPage(int index) {
  switch (index) {
    case 0:
      return const ImcPage(); // Use o widget ImcPage para a página de cálculo
    case 1:
      return const Center(child: Text('Calculator Page'));
    default:
      return const Center(child: Text('Welcome to the IMC Calculator!'));
  }
}
