import 'package:flutter/material.dart';
import 'package:teste_flutter_create/screens/listaProdutos.dart';

import '../components/input.dart';



class Login extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  static final TextEditingController _usuario = TextEditingController();
  static final TextEditingController _password = TextEditingController();


  static final validator = InputValidator();

  final Inputs = [
    Input(
      label: 'Usuário',
      validator: validator.validateText,
      onSaved: (String value) {
        _usuario.text = value;
      },
    ),
    Input(
        label: 'Senha',
        validator: validator.validateText,
        onSaved: (String value) {
          _password.text = value;
        })
  ];

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListaProdutos())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                'imgs/danissan_mangas.png',
                height: 150.0,
                fit: BoxFit.fitWidth,
              ),
              const Text(
                'Faça login',
                style: TextStyle(color: Colors.black54, fontSize: 20.0),
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
                          style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(130.0, 50.0)), backgroundColor: MaterialStatePropertyAll(Colors.red)),
                          onPressed: () => _sendForm(),
                          child: const Text('Login'),
                        ),
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