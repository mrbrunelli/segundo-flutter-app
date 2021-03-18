import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:segundo_flutter_app/funcoes.dart';
import 'package:segundo_flutter_app/ui/contato_page.dart';
import 'package:segundo_flutter_app/widgets/campo_texto.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();
  var resultado = "";
  Funcoes func = new Funcoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etanol x Gasolina"),
        actions: [
          IconButton(
              icon: Icon(Icons.share),
            onPressed: _compartilhar,
          ),
        ],
      ),
      floatingActionButton: criarBotaoFlutuante(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CampoTexto.criar(etanolController, "Valor do Etanol", "R\$ ", TextInputType.number),
          CampoTexto.criar(gasolinaController, "Valor da Gasolina", "R\$ ", TextInputType.number),
          criarTextoResultado(resultado),
        ],
      ),
    );
  }

  Widget criarBotaoFlutuante() {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: Icon(Icons.mail_outline, color: Colors.white, size: 40,),
      onPressed: _abrirTelaContato,
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

  void eventoCalcular() {
    if (etanolController.text.isEmpty) {
      func.mostrarMensagem(context, "Atenção", "Valor do Etanol deve ser preenchido!");
      return;
    }
    if (gasolinaController.text.isEmpty) {
      func.mostrarMensagem(context, "Atenção", "Valor da Gasolina deve ser preenchido!");
      return;
    }
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
    func.mostrarMensagem(context, "Atenção", "Você abriu o AlertDialog");
    setState(() {
      resultado = "Olá Mundo!";
    });
  }

  void _compartilhar() {
    Share.share("Etanol: " + etanolController.text + ". Gasolina: " + gasolinaController.text);
  }

  void _abrirTelaContato() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContatoPage())
    );
  }
}
