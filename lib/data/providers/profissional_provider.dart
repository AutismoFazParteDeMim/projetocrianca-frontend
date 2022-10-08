import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/profissional_model.dart';

class ProfissionalProvider {
  final Dio dio = Dio();

  final String baseUrl = "http://3.94.50.82:8080/autismofazpartedemim";
  final String rotaLinkBaseUrl = "https://www.google.com/maps/search/?api=1&query=";

  Future<List<ProfissionalModel?>?> getProfissionals() async {
    final List<dynamic>? response =
        await dio.get("$baseUrl/profissionais").then((value) => value.data);
    

    if (response != null) {
      final List<ProfissionalModel?> profissionals = [];
      for (var element in response) {
        final Uri rotaLinkUrl = Uri.parse("$rotaLinkBaseUrl${element['latitude']},${element['longitude']}");
        log(rotaLinkUrl.toString());
        profissionals.add(ProfissionalModel(
          profissionalId: element["id"],
          nome: element["nome"],
          latitude: element["latitude"],
          longitude: element["longitude"],
          endereco: "Rua Max Colin, 550, America",
          diasFuncionamento: "seg - sex",
          horario: "8:00 as 18:00",
          telefone: "(47) 3422-2419",
          email: null,
          descricao:
              "É responsável pelo projeto O Farol, espaço de empreendedorismo para fortalecer negócios e projetos sociais, culturais e esportivos; e pelo Espaço do Empreendedor, para orientar pessoas que precisam aderir ao MEI (Microempreendedor Individual) e empresas em geral no auxílio em processos, retirada de dúvidas etc.",
          rotaLink: rotaLinkUrl,
        ));
      }

      return profissionals;
    }

    return null;
  }
}
