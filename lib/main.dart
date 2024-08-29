import 'package:flutter/material.dart';
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
  late Widget _currentWidget;

  @override
  void initState() {
    super.initState();
    _currentWidget = buildPage(_currentIndex); // Use the imported buildPage function
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentWidget = buildPage(index); // Use the imported buildPage function
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
