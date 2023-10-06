import 'dart:convert';
import 'package:cep/cep.dart';
import 'package:http/http.dart' as http;

class CEPCepService {
  List<CEP> ceps = [];
  Future<CEP> consultarCEP(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CEP(
        cep: data['cep'],
        logradouro: data['logradouro'],
        bairro: data['bairro'],
        cidade: data['localidade'],
        estado: data['uf'],
      );
    } else {
      throw Exception('Erro ao consultar o CEP');
    }
  }

  Future<void> cadastrarCEP(CEP cep) async {
    ceps.add(cep);
    print('CEP adicionado localmente');
  }

  Future<void> editarCEP(CEP cep) async {
    final index = ceps.indexWhere((element) => element.cep == cep.cep);
    if (index != -1) {
      ceps[index] = cep;
      print('CEP editado localmente');
    } else {
      print('CEP não encontrado na lista local');
    }
  }

  Future<void> excluirCEP(CEP cep) async {
    final index = ceps.indexWhere((element) => element.cep == cep.cep);
    if (index != -1) {
      ceps.removeAt(index);
      print('CEP excluído localmente');
    } else {
      print('CEP não encontrado na lista local');
    }
  }
}

List<CEP> ceps = []; // Lista simulada de CEPs

