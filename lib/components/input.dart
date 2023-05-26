import 'package:flutter/material.dart';


class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String? value) => widget.onSaved(value ?? ''),
      keyboardType: widget.keyboardType,
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
    required this.onSaved,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final void Function(String value) onSaved;
  final TextInputType keyboardType;

  @override
  State<StatefulWidget> createState() => _InputState();
}