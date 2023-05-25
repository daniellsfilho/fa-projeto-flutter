import 'package:flutter/material.dart';
import 'package:teste_flutter_create/screens/cadastroEndereco.dart';

class ResultadoEndereco extends StatelessWidget{

  final String nome;
  final String endereco;
  final String numero;
  final String complemento;
  final String uf;
  final String cep;

  const ResultadoEndereco({Key? key, required this.nome, required this.endereco, required this.numero, required this.complemento, required this.uf, required this.cep}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final tenPercentOfScreen = (MediaQuery.of(context).size.width / 100) * 10;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado formulário')),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: tenPercentOfScreen/2,
          horizontal: tenPercentOfScreen > 64 ? tenPercentOfScreen * 1.5 : tenPercentOfScreen,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 100.0, 
              child: Text('Informações recebidas:', style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            
            SizedBox(height: 200.0,
              child: Text('Nome: $nome \nEndereço: $endereco \nNúmero: $numero \nComplemento: $complemento \nEstado: $uf \nCEP: $cep',
                style: const TextStyle(fontSize: 20.0, color: Colors.black54))),

            const SizedBox(height: 100.0),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200.0, 50.0))),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormCadastro())),
                child: const Text('Voltar'),
              )
            )
          ],),
      ),
    );
  }
}