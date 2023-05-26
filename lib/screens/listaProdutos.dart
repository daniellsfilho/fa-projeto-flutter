import 'package:flutter/material.dart';


class ListaProdutos extends StatefulWidget {
  @override
  ListaProdutosState createState() => ListaProdutosState();
}

class ListaProdutosState extends State<ListaProdutos> {

  Map<String, bool> valores = {
    'Flutter': false,
    'React Native': false,
    'Ionic': false,
    'Kotlin': false,
    'Java': false
  };

  @override
  Widget build(BuildContext context) {
    final fivePercentOfScreen = (MediaQuery.of(context).size.width / 100) * 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de produtos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: fivePercentOfScreen,
          horizontal: fivePercentOfScreen > 64
              ? fivePercentOfScreen * 1.5
              : fivePercentOfScreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildCheckboxes()
        ),
      ),
    );
  }

  List<Widget> _buildCheckboxes() {
    List<Widget> checkboxes = [];
    var label = const SizedBox(
      child: Text('Quais tecnologias Mobile você conhece?',
          style: TextStyle(color: Colors.black54, fontSize: 24.0)),
    );
    checkboxes.add(label);
    valores.forEach((String key, bool value) {
      checkboxes.add(
        CheckboxListTile(
          title: Text(key),
          value: value,
          onChanged: (newValue) {
            setState(() {//altera o estado da variável
              newValue!=null? //se diferente de null
                //alterna valor entre verdadeiro e falso
                valores[key]==true? valores[key]=false:
                valores[key] = true
               : valores[key] = false;  
            });

          },
        ),
      );
    });
    return checkboxes;
  }
}
