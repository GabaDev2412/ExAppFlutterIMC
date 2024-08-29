import 'package:flutter/material.dart';

class FormImc extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const FormImc({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um(a) $title';
          }
          return null;
        },
      ),
    );
  }
}
