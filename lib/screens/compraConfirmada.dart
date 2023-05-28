import 'package:flutter/material.dart';
import 'package:teste_flutter_create/screens/listaProdutos.dart';

class CompraConfirmada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Compra confirmada',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'imgs/danissan_mangas.png',
              height: 150.0,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 32.0),
            const Text('Pedido confirmado!',
                style: TextStyle(fontSize: 20.0, color: Colors.black54)),
            const SizedBox(height: 32.0),
            ElevatedButton(
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(130.0, 50.0)),
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListaProdutos())),
              child: const Text('Voltar'),
            ),
          ],
        )));
  }
}
