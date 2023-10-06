import 'package:cep/cep_edit_screen.dart';
import 'package:flutter/material.dart';
import 'cep.dart';
import 'cep_service.dart';

class CEPDetailsScreen extends StatelessWidget {
  final CEP cep;
  final cepService = CEPCepService();

  CEPDetailsScreen(this.cep);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do CEP'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CEPEditScreen(cep),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Excluir CEP'),
                    content: Text('Tem certeza de que deseja excluir este CEP?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          cepService.excluirCEP(cep);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text('Confirmar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CEP: ${cep.cep}'),
            Text('Logradouro: ${cep.logradouro}'),
            Text('Bairro: ${cep.bairro}'),
            Text('Cidade: ${cep.cidade}'),
            Text('Estado: ${cep.estado}'),
          ],
        ),
      ),
    );
  }
}
