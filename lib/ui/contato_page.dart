import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:segundo_flutter_app/funcoes.dart';
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

  Future<void> enviar() async {
    String usuario = "meu_email@gmail.com";
    String token = "token_maluco_de_acesso";
    final servidorSMTP = gmailSaslXoauth2(usuario, token);
    final mensagem = Message()
      ..from("Contato App", usuario)
      ..recipients.add(usuario)
      ..subject = "Contato App"
      ..text = "Nome: ${nomeController.text}. E-mail: ${emailController}. Mensagem: ${mensagemController}";
    final enviar = await send(mensagem, servidorSMTP);
    setState(() {
      _esvaziarInput(nomeController);
      _esvaziarInput(emailController);
      _esvaziarInput(mensagemController);
      Funcoes().mostrarMensagem(context, "Contato", "E-mail enviadoc com sucesso!");
    });
  }

  void _esvaziarInput(TextEditingController input) {
    input.text = "";
  }
}
