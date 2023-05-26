import 'package:flutter/material.dart';
import 'package:teste_flutter_create/screens/listaProdutos.dart';

class Login extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  static final TextEditingController _usuario = TextEditingController();
  static final TextEditingController _password = TextEditingController();
  static bool _envio = false;
  var _errorMessage = '';

  void _sendForm() {
    _envio = true;
    if (_usuario.text != '' && _password.text != '') {
      if (_usuario.text != 'teste' || _password.text != '123456') {
        _errorMessage = "Acesso não permitido";
      } else {
        _errorMessage = '';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListaProdutos()));
      }
    } else {
      _errorMessage = "Fornecer informações para acesso";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Faça login',
                  style: TextStyle(color: Colors.black54, fontSize: 20.0),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                    width: 300,
                    child: TextField(
                        controller: _usuario,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Entre com username',
                        ))),
                SizedBox(
                    width: 300,
                    child: TextField(
                        controller: _password,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Digite uma senha',
                        ))),
                const SizedBox(height: 16.0),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 100.0,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(130.0, 50.0)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  onPressed: _sendForm,
                                  child: const Text('Login'),
                                )
                              ],
                            )),
                      ],
                    )),
                _envio
                    ? SizedBox(
                        height: 50.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_errorMessage,
                                style: const TextStyle(color: Colors.red))
                          ],
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
