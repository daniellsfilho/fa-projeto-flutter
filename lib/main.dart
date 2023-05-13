import 'package:flutter/material.dart';
import 'package:teste_flutter_create/screens/cadastroEndereco.dart';

void main() {
  runApp(CadastroDeEndereco());
}

class CadastroDeEndereco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de endereço',
      home: FormCadastro(),
    );
  }
}

