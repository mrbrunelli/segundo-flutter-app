import 'package:flutter/material.dart';

class Funcoes {
  void mostrarMensagem(BuildContext context, String titulo, String mensagem) {
    showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mensagem),
            actions: [
              TextButton(
                  onPressed: () {
                    _fecharTelaAtual(context);
                  },
                  child: Text("Ok")
              ),
            ],
          );
        }
    );
  }
  
  void _fecharTelaAtual(BuildContext context) {
    Navigator.pop(context);
  }
}