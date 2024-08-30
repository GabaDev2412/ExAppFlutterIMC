import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa.dart';
import 'package:myapp/utils/calcular_imc.dart';
import 'package:myapp/widgets/bottom_bar.dart';
import 'package:myapp/pages/build_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'IMC Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Pessoa> _pessoas = [];
  String _imc = '';
  String _textImcAnalyze = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildPage(_currentIndex, _pessoas, _imc, _textImcAnalyze),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void updateIMCList(Pessoa pessoa) {
    setState(() {
      _pessoas.add(pessoa);
      _imc = pessoa.calcularIMC(pessoa.altura, pessoa.peso).toStringAsFixed(2);
      _textImcAnalyze = analiseIMC(double.parse(_imc));
    });
  }
}