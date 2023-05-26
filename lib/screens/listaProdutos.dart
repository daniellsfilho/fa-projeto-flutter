import 'package:flutter/material.dart';

class ListaProdutos extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    final fivePercentOfScreen = (MediaQuery.of(context).size.width / 100) * 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: fivePercentOfScreen,
          horizontal: fivePercentOfScreen > 64 ? fivePercentOfScreen * 1.5 : fivePercentOfScreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Oi')
          ],
        ),
      ),
    );
  }
}