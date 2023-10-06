import 'package:cep/cep_add_screen.dart';
import 'package:cep/cep_details_screen.dart';
import 'package:flutter/material.dart';

import 'cep_service.dart';

class CEPListScreen extends StatefulWidget {
  @override
  _CEPListScreenState createState() => _CEPListScreenState();
}

class _CEPListScreenState extends State<CEPListScreen> {
  final cepService = CEPCepService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEPs Cadastrados'),
      ),
      body: ListView.builder(
        itemCount: cepService.ceps.length,
        itemBuilder: (context, index) {
          final cep = cepService.ceps[index];
          return ListTile(
            title: Text(cep.cep),
            subtitle: Text('${cep.logradouro}, ${cep.bairro}, ${cep.cidade} - ${cep.estado}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CEPDetailsScreen(cep),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CEPAddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
