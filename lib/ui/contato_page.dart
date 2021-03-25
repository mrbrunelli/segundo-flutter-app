import 'package:flutter/material.dart';
import 'package:segundo_flutter_app/widgets/barra_titulo.dart';
import 'package:segundo_flutter_app/widgets/botao.dart';
import 'package:segundo_flutter_app/widgets/campo_texto.dart';

class ContatoPage extends StatefulWidget {
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar("Contato", icone: Icons.mail_outline),
      body: ListView(
        children: [
          CampoTexto.criar(nomeController, "Nome", "", TextInputType.text),
          CampoTexto.criar(emailController, "E-mail", "", TextInputType.emailAddress),
          CampoTexto.criar(mensagemController, "Mensagem", "", TextInputType.text),
          Column(
            children: [
              Botao.criar("Enviar", enviar),
            ],
          ),
        ],
      )
    );
  }

  void enviar() {

  }
}
