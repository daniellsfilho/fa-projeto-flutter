import 'package:flutter/material.dart';

class InputValidator {
  String? validateText(String value, String field) {
    if (field == 'Complemento' || field == 'Número') return null;

    if (field != 'E-mail') {
      if (value.length == 0) {
        return "Informe o $field";
      }
      return null;
    }
  }
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String? value) => widget.onSaved(value ?? ''),
      keyboardType: widget.keyboardType,
      validator: (String? value) => widget.validator(value ?? '', widget.label),
      decoration: InputDecoration(
        hintText: 'Digite o ${widget.label}',
        border: OutlineInputBorder(),
        label: Text(widget.label),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  const Input({
    Key? key,
    required this.label,
    required this.validator,
    required this.onSaved,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final String? Function(String value, String field) validator;
  final void Function(String value) onSaved;
  final TextInputType keyboardType;

  @override
  State<StatefulWidget> createState() => _InputState();
}