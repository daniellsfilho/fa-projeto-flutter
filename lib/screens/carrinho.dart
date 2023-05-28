import 'package:flutter/material.dart';
import '../components/input.dart';
import 'compraConfirmada.dart';

class Carrinho extends StatefulWidget {
  final String nomeProduto;
  const Carrinho({Key? key, required this.nomeProduto}) : super(key: key);

  @override
  CarrinhoState createState() => CarrinhoState();
}

class CarrinhoState extends State<Carrinho> {
  final _formKey = GlobalKey<FormState>();
  static final validator = InputValidator();
  var quantidade = 1;

  void _confirmarCompra() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompraConfirmada()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final fivePercentOfScreen = (MediaQuery.of(context).size.width / 100) * 5;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Carrinho', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: fivePercentOfScreen,
            horizontal: fivePercentOfScreen > 64
                ? fivePercentOfScreen * 1.5
                : fivePercentOfScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Detalhes da compra: ',
                style: TextStyle(color: Colors.black54, fontSize: 20.0)),
            const SizedBox(height: 16.0),
            ListTile(
                leading: const Icon(Icons.book),
                title: Text(widget.nomeProduto,
                    style: const TextStyle(
                        fontSize: 16.0, color: Colors.black45))),
            const SizedBox(height: 8.0),
            Form(
              key: _formKey,
              child: Input(
                label: 'Quantidade',
                validator: validator.validateText,
                onSaved: (String value) => quantidade = int.parse(value),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () => Navigator.pop(context), 
                  child: const Text('Voltar', style: TextStyle(color: Colors.red)), 
                  style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(130.0, 50.0)))),
                ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(130.0, 50.0)),
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => _confirmarCompra(),
                    child: const Text('Confirmar',
                        style: TextStyle(color: Colors.white)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
