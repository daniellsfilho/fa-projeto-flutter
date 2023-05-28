import 'package:flutter/material.dart';

import 'carrinho.dart';

class ListaProdutos extends StatelessWidget {

  final items = [
    "Bleach Remix vol. 4",
    "Jujutsu Kaisen Vol.1",
    "Berserk Vol.3"
  ];

  @override
  Widget build(BuildContext context){
    final fivePercentOfScreen = (MediaQuery.of(context).size.width / 100) * 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: fivePercentOfScreen,
          horizontal: fivePercentOfScreen > 64 ? fivePercentOfScreen * 1.5 : fivePercentOfScreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Seja bem-vindo(a), selecione o produto que deseja comprar:', style: TextStyle(color: Colors.black54, fontSize: 20.0)),
            const SizedBox(height: 20.0),
            ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(items[index], style: const TextStyle(fontSize: 16.0, color: Colors.black45)),
                  trailing: ElevatedButton(
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text('Comprar', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho(nomeProduto: items[index]))),
                  ));
                
              },
            )
          ],
        ),
      ),
    );
  }
}