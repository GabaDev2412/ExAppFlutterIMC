import 'package:flutter/material.dart';
import './widgets/bottom_bar.dart';  // Import the BottomBar widget

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
  late Widget _currentWidget;

  @override
  void initState() {
    super.initState();
    _currentWidget = _buildPage(_currentIndex);
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Welcome to the IMC Calculator!'));
      case 1:
        return const Center(child: Text('Calculator Page'));
      default:
        return const Center(child: Text('Welcome to the IMC Calculator!'));
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentWidget = _buildPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentWidget,
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
