import 'package:flutter/material.dart';

import 'cep_service.dart';

class CEPAddScreen extends StatefulWidget {
  @override
  _CEPAddScreenState createState() => _CEPAddScreenState();
}

class _CEPAddScreenState extends State<CEPAddScreen> {
  final cepService = CEPCepService();
  final _formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um CEP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final cep = _cepController.text;
                    cepService.consultarCEP(cep).then((cep) {
                      cepService.cadastrarCEP(cep);
                      Navigator.pop(context);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Erro ao consultar o CEP: $error'),
                        ),
                      );
                    });
                  }
                },
                child: Text('Adicionar CEP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
