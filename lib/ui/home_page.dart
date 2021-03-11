import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();
  var resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etanol x Gasolina"),
      ),
      floatingActionButton: criarBotaoFlutuante(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          criarCampoTexto(etanolController, "Valor do Etanol", "R\$ "),
          criarCampoTexto(gasolinaController, "Valor da Gasolina", "R\$ "),
          criarTextoResultado(resultado),
        ],
      ),
    );
  }

  Widget criarBotaoFlutuante() {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: Icon(Icons.attach_money_outlined, color: Colors.white, size: 40,),
      onPressed: eventoCalcular,
    );
  }

  Widget criarBotao(String txt, Function e) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: ElevatedButton(
          child: Text(txt, style: TextStyle(color: Colors.white, fontSize: 25),),
          onPressed: e,
        ),
    );
  }

  Widget criarTextoResultado(String txt) {
    return Center(
      child: Text(txt, style: TextStyle(fontSize: 22)),
    );
  }

  Widget criarCampoTexto(TextEditingController ctx, String label, String prefix) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: ctx,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
            labelStyle: TextStyle(color: Colors.blue, fontSize: 22),
            prefixText: prefix,
            prefixStyle: TextStyle(color: Colors.green[900], fontSize: 32)
        ),
        style: TextStyle(color: Colors.blue, fontSize: 50),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void eventoCalcular() {
    double valorEtanol = double.parse(etanolController.text);
    double valorGasolina = double.parse(gasolinaController.text);
    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = "Melhor abastecer com Etanol.";
    } else {
      resultado = "Melhor abastecer com Gasolina.";
    }
    setState(() {});
  }

  void eventoOla() {
    setState(() {
      resultado = "Olá Mundo!";
    });
  }
}
