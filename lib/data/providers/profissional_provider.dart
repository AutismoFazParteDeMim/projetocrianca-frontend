import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/profissional_model.dart';

class ProfissionalProvider {
  final Dio dio = Dio();

  final String baseUrl = "http://34.224.80.102:8080/autismofazpartedemim";

  Future<List<ProfissionalModel?>?> getProfissionals() async {
    final List<dynamic>? response =
        await dio.get("$baseUrl/profissionais").then((value) => value.data);

    if (response != null) {
      final List<ProfissionalModel?> profissionals = [];

      for (var element in response) {
        profissionals.add(ProfissionalModel(
          profissionalId: element["id"],
          nome: element["nome"],
          latitude: element["latitude"],
          longitude: element["longitude"],
        ));
      }

      return profissionals;
    }

    return null;
  }
}
