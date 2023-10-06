import 'package:flutter/material.dart';
import 'cep.dart';
import 'cep_service.dart';

class CEPEditScreen extends StatefulWidget {
  final CEP cep;
  final cepService = CEPCepService();

  CEPEditScreen(this.cep);

  @override
  _CEPEditScreenState createState() => _CEPEditScreenState();
}

class _CEPEditScreenState extends State<CEPEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _logradouroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _logradouroController.text = widget.cep.logradouro;
    _bairroController.text = widget.cep.bairro;
    _cidadeController.text = widget.cep.cidade;
    _estadoController.text = widget.cep.estado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _logradouroController,
                decoration: InputDecoration(labelText: 'Logradouro'),
              ),
              TextFormField(
                controller: _bairroController,
                decoration: InputDecoration(labelText: 'Bairro'),
              ),
              TextFormField(
                controller: _cidadeController,
                decoration: InputDecoration(labelText: 'Cidade'),
              ),
              TextFormField(
                controller: _estadoController,
                decoration: InputDecoration(labelText: 'Estado'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final cepAtualizado = CEP(
                      cep: widget.cep.cep,
                      logradouro: _logradouroController.text,
                      bairro: _bairroController.text,
                      cidade: _cidadeController.text,
                      estado: _estadoController.text,
                    );
                    widget.cepService.editarCEP(cepAtualizado);
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
