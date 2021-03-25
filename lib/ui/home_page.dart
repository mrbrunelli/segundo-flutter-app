import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:segundo_flutter_app/funcoes.dart';
import 'package:segundo_flutter_app/ui/contato_page.dart';
import 'package:segundo_flutter_app/widgets/barra_titulo.dart';
import 'package:segundo_flutter_app/widgets/botao.dart';
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
      appBar: BarraTitulo.criar("Etanol X Gasolina", iconeAcao: Icons.share, evento: _compartilhar),
      floatingActionButton: Botao.criarBotaoFlutuante(Icons.arrow_forward, _abrirTelaContato),
      body: ListView(
        children: <Widget>[
          CampoTexto.criar(etanolController, "Valor do Etanol", "R\$ ", TextInputType.number),
          CampoTexto.criar(gasolinaController, "Valor da Gasolina", "R\$ ", TextInputType.number),
          Column(
            children: [
              Botao.criar("Calcular", eventoCalcular),
            ],
          ),
          criarTextoResultado(resultado),
        ],
      ),
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
