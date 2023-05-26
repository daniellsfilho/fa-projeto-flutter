import 'package:flutter/material.dart';

class ListaProdutos extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    final fivePercentOfScreen = (MediaQuery.of(context).size.width / 100) * 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos', style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: fivePercentOfScreen,
          horizontal: fivePercentOfScreen > 64 ? fivePercentOfScreen * 1.5 : fivePercentOfScreen,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Quais tecnologias Mobile você conhece?', style: TextStyle(color: Colors.black54, fontSize: 24.0))
          ],
        ),
      ),
    );
  }
}