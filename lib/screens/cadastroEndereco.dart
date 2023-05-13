import 'package:flutter/material.dart';

import '../components/input.dart';



class FormCadastro extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<FormCadastro> {
  final _formKey = GlobalKey<FormState>();
  static final TextEditingController _nome = TextEditingController();
  static final TextEditingController _endereco = TextEditingController();
  static final TextEditingController _numero = TextEditingController();
  static final TextEditingController _complemento = TextEditingController();
  static final TextEditingController _uf = TextEditingController();
  static final TextEditingController _cep = TextEditingController();

  static final validator = InputValidator();

  final Inputs = [
    Input(
      label: 'Nome',
      validator: validator.validateText,
      onSaved: (String value) {
        _nome.text = value;
      },
    ),
    Input(
        label: 'Endereço',
        validator: validator.validateText,
        onSaved: (String value) {
          _endereco.text = value;
        }),
    Input(
        label: 'Número',
        validator: validator.validateText,
        onSaved: (String value) {
          _numero.text = value;
        }),
    Input(
        label: 'Complemento',
        validator: validator.validateText,
        onSaved: (String value) {
          _complemento.text = value;
        }),
    Input(
        label: 'Estado',
        validator: validator.validateText,
        onSaved: (String value) {
          _uf.text = value;
        }),
    Input(
        label: 'CEP',
        validator: validator.validateText,
        onSaved: (String value) {
          _cep.text = value;
        }),
  ];

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Dados enviados com sucesso!')));
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário de cadastro')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Crie sua conta!',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 300,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: Inputs.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 8.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Inputs[index];
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => _sendForm(),
                          child: const Text('Enviar'),
                        ),
                        ElevatedButton(
                          onPressed: () => _formKey.currentState!.reset(),
                          child: const Text('Cancelar'),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
